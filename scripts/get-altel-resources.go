package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"net/http/cookiejar"
	"net/url"
	"os"
	"os/exec"
	"strconv"
)

type Data struct {
	Title      string  `json:"title"`
	Value      string  `json:"value"`
	Full       bool    `json:"full"`
	Percentage float64 `json:"percentage"`
	ExpDate    string  `json:"expDate"`
	BegDate    string  `json:"begDate"`
}

func showMsg(m string, duration int) {
	exec.Command("notify-send", "-t", strconv.Itoa(duration), m).Run()
}

func main() {

	jar, err := cookiejar.New(&cookiejar.Options{})
	if err != nil {
		log.Fatal(err)
	}

	login := os.Getenv("ALTEL_LOGIN")
	password := os.Getenv("ALTEL_PASS")
	if login == "" || password == "" {
		showMsg("Not credentials defined", 5000)
		return
	}

	client := &http.Client{
		Jar: jar,
	}

	// login and getting cookie
	showMsg("Logging in", 5000)
	resp, err := client.PostForm("https://cabinet.altel.kz/login",
		url.Values{"loginId": {login}, "password": {password}})

	if err != nil {
		showMsg(fmt.Sprintf("Login error\n%s", err.Error()), 10000)
		return
	}
	resp.Body.Close()

	showMsg("Getting quota", 5000)
	resp2, err := client.Get("https://cabinet.altel.kz/getTariffResources")

	if err != nil {
		showMsg(fmt.Sprintf("Fetch error\n%s", err.Error()), 10000)
		return
	}
	defer resp2.Body.Close()

	parsed := []Data{}
	json.NewDecoder(resp2.Body).Decode(&parsed)

	if len(parsed) == 0 {
		showMsg("No data returned", 10000)
		return
	}

	expDate := ""

	msg := ""
	for _, d := range parsed {
		msg = msg + fmt.Sprintf("%s: %s\n", d.Title, d.Value)
		if expDate == "" {
			expDate = d.ExpDate
		}
	}

	if expDate != "" {
		msg = msg + fmt.Sprintf("ExpDate: %s", expDate)
	}

	showMsg(msg, 50000)
}
