import axios from "axios";
import baseUrl  from "./baseURL"

export class SaloonTimeService {

    // apiUrl = "http://localhost:8080/api/movie/movieSaloonTimes/"

    getMovieSaloonTimeSaloonAndMovieId(saloonId, movieId) {
        return axios.get(baseUrl + "movie/movieSaloonTimes/getMovieSaloonTimeSaloonAndMovieId/" + saloonId + "/" + movieId);
    }

}