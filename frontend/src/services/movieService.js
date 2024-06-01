import axios from "axios";
import baseUrl  from "./baseURL"

export class MovieService {

    // apiUrl = "http://localhost:8080/api/movie/movies/"

    getAllDisplayingMovies() {
        return axios.get(baseUrl + "movie/movies/displayingMovies");
    }

    getAllComingSoonMovies() {
        return axios.get(baseUrl + "movie/movies/comingSoonMovies");
    }

    getMovieById(movieId) {
        return axios.get(baseUrl + "movie/movies/" +movieId);
    }

    addMovie(movieDto) {
        return axios.post(baseUrl + "movie/movies/add", movieDto);
    }
}