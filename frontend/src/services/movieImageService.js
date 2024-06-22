import axios from "axios";
import baseUrl  from "./baseURL"

export class MovieImageService {

    // apiUrl = "http://localhost:8080/api/movie/images/"
    
    addMovieImage(imageDto) {
        return axios.post(baseUrl + "movie/images/add", imageDto);
    }
}