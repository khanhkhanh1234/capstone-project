import axios from "axios"
import baseUrl  from "./baseURL"

export class CategoryService{
    // apiUrl = "http://localhost:8080/api/movie/categories/"

    getall() {
        return axios.get(baseUrl + "movie/categories/getall")
    }
}