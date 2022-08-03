package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID         string `json:"id"`
	TaskName   string `json:"task_name"`
	TaskDetail string `json:"task_details"`
	Date       string `json:"date"`
}

var tasks []Tasks

func allTasks() {
	task := Tasks{
		ID:         "1",
		TaskName:   "new projects",
		TaskDetail: "You must lead the project and finish it",
		Date:       "2022-01-22",
	}

	tasks = append(tasks, task)
	fmt.Println("your task are", tasks)

}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println(" this is the gome page")
}
func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/")
	json.NewEncoder(w).Encode(tasks)
	fmt.Println(" this is the gome page")
}
func getTask(w http.ResponseWriter, r *http.Request) {
	taskId := mux.Vars(r)
	flag := false
	for i := 0; i < len(tasks); i++ {
		if taskId["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
		if !flag {
			json.NewEncoder(w).Encode(map[string]string{"status": "error"})
		}
	}

	fmt.Println(" this is the gome page")
}
func createTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println(" this is the gome page")
}
func deleteTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println(" this is the gome page")
}
func updateTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println(" this is the gome page")
}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8002", router))
}

func main() {
	fmt.Println("Hello, World! llllollollooll")
	allTasks()
	handleRoutes()
}
