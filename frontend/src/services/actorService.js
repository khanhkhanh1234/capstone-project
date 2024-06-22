import axios from "axios";
import baseUrl  from "./baseURL"

export class ActorService {

    // apiUrl = "http://localhost:8080/api/movie/actors/"

    getActorsByMovieId(movieId) {
        return axios.get(baseUrl + "movie/actors/getActorsByMovieId/" + movieId);
    }

    getall() {
        return axios.get(baseUrl + "movie/actors/getall");
    }
    
    addActor(actorDto) {
        return axios.post(baseUrl + "movie/actors/add", actorDto);
    }
}