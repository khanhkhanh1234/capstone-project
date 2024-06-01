import axios from "axios";
import baseUrl  from "./baseURL"

export class CityService {

    // apiUrl = "http://localhost:8080/api/movie/cities/"

    getCitiesByMovieId(movieId) {
        return axios.get(baseUrl + "movie/cities/getCitiesByMovieId/" + movieId);
    }

    getall() {
        return axios.get(baseUrl + "movie/cities/getall");
    }

    addCity(cityDto) {
        return axios.post(baseUrl + "movie/cities/add", cityDto);
    }
}