import axios from "axios"
import baseUrl  from "./baseURL"

export class DirectorService{
    // apiUrl = "http://localhost:8080/api/movie/directors/"

    getall() {
        return axios.get(baseUrl + "movie/directors/getall")
    }

    add(director) {
        return axios.post(baseUrl + "movie/directors/add", director);
    }
}