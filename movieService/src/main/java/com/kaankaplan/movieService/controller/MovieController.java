package com.kaankaplan.movieService.controller;

import com.kaankaplan.movieService.business.abstracts.MovieService;
import com.kaankaplan.movieService.entity.Movie;
import com.kaankaplan.movieService.entity.dto.MovieRequestDto;
import com.kaankaplan.movieService.entity.dto.MovieResponseDto;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.retry.annotation.Retry;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

@RestController
@RequestMapping("/api/movie/movies/")
@RequiredArgsConstructor
public class MovieController {

    private final MovieService movieService;
    private final AtomicBoolean isHealthy = new AtomicBoolean(true); // Thread-safe flag to track health status

    @GetMapping("displayingMovies")
    public List<MovieResponseDto> getAllDisplayingMoviesInVision() {
        return movieService.getAllDisplayingMoviesInVision();
    }

    @GetMapping("comingSoonMovies")
    public List<MovieResponseDto> getAllComingSoonMovies() {
        return movieService.getAllComingSoonMovies();
    }

    @GetMapping("{movieId}")
    public MovieResponseDto getMovieById(@PathVariable int movieId) {
        return movieService.getMovieByMovieId(movieId);
    }

    @PostMapping("add")
    @CircuitBreaker(name="movie", fallbackMethod = "fallback")
    @Retry(name="movie")
    public Movie addMovie(@RequestBody MovieRequestDto movieRequestDto) {
        return movieService.addMovie(movieRequestDto);
    }

    private Movie fallback(MovieRequestDto movieRequestDto, RuntimeException runtimeException) throws RuntimeException {
        return null;
    }

    // New API to check health of the container
    @GetMapping("/healthz")
    public ResponseEntity<String> healthCheck() {
        if (isHealthy.get()) {
            return ResponseEntity.ok("Healthy");
        } else {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body("Unhealthy");
        }
    }

    // New API to kill the health check
    @PostMapping("/kill-mode")
    public ResponseEntity<String> enableKillMode() {
        isHealthy.set(false);
        return ResponseEntity.ok("Kill mode enabled");
    }
}
