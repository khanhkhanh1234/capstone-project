import axios from "axios";
import baseUrl  from "./baseURL"

export class CommentService {

    // apiUrl = "http://localhost:8080/api/movie/comments/"

    getCommentsByMovieId(movieId, pageNo, pageSize=5) {
        return axios.get(baseUrl + "movie/comments/getCommentsByMovieId/" + movieId + "/" + pageNo + "/" + pageSize);
    }

    getCountOfComments(movieId) {
        return axios.get(baseUrl + "movie/comments/getCountOfComments/" + movieId);
    }

    addComment(commentDto) {
        return axios.post(baseUrl + "movie/comments/add" , commentDto);
    }
    
    deleteComment(deleteCommentDto) {
        return axios.post(baseUrl + "movie/comments/delete" , deleteCommentDto);
    }
}