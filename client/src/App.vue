<script>
import Header from "./components/Header.vue";
import Content from "./components/Content.vue";
import SearchBar from "./components/Searchbar.vue";
import Footer from "./components/Footer.vue";
import MovieCard from "./components/MovieCard.vue";
import AddMovie from "./components/AddMovie.vue";
import CookieBanner from "./components/CookieBanner.vue";

export default {
  data() {
    return {
      moviesData: [],
      moviesGeners: [],
      maxYear: 0,
      minYear: 0,
      allYears: [],
      showModal: false,
      selectedGenre: 0,
      title: "",
      releaseDate: 2015,
      summary: "",
      image: "",
      quality: "",
      length: 0,
      trailer: "",
      viewed: 0,
      rated: 0,
      
    };
  },
  methods: {
    async getData() {
      const res = await fetch("http://localhost:5000/movie");
      const finalRes = await res.json();
      this.moviesData = finalRes;
      console.log(finalRes)
    },
    async getDataGeners() {
      const res = await fetch("http://localhost:5000/genre");
      const finalRes = await res.json();
      this.moviesGeners = finalRes;
    },
    async handleAddMovie(body) {
      this.showModal = !this.showModal;
      const movieData = {
        title: body.title,
        year: body.releaseDate,
        genre: body.selectedGenre,
        summary: body.summary,
        image: body.image,
        quality: body.quality,
        length: body.length,
        trailer: body.trailer,
        viewed: 0,
        rated: 0,
        
        };

      await fetch("http://localhost:5000/movie", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(movieData),
      })
    },
    saveMovie(body){
      this.handleAddMovie(body)
      this.componentKey++
    },
    handleOnOffMovie() {
      this.showModal = !this.showModal;
      this.title = "";
      this.releaseDate = 0;
      this.selectedGenre = 0;
      this.summary = "";
      this.image = "";
      this.quality = "";
      this.length = 0;
      this.trailer = "";
      this.getData()
      
    },
    modal(){
      return this.showModal
    },
    updateMoviesOnOff(){
        this.showModal = !this.showModal;
    },
  updateMoviesData(updatedMoviesData) {
      this.moviesData = updatedMoviesData;
    },
    findMaxYearInMoviesData() {
      if (this.moviesData.length === 0) {
        this.maxYear = 0;
        return;
      }

      const moviesYears = this.moviesData.map((movie) => movie.year);
      this.maxYear = Math.max(...moviesYears);
      //console.log(this.maxYear);
    },
    findMinYearInMoviesData() {
      if (this.moviesData.length === 0) {
        this.minYear = 0;
        return;
      }

      const moviesYears = this.moviesData.map((movie) => movie.year);
      this.minYear = Math.min(...moviesYears);
      //console.log(this.minYear);
    },
    mapAllYearsFromMoviesData() {
      this.allYears = [...new Set(this.moviesData.map((movie) => movie.year))];
      //console.log(this.allYears);
    },

    
  },
  mounted() {
    this.getData();
    this.getDataGeners();
    this.findMaxYearInMoviesData();
    this.findMinYearInMoviesData();
    this.mapAllYearsFromMoviesData();
  },
  components: {
    Header,
    Content,
    SearchBar,
    Footer,
    MovieCard,
    AddMovie,
    CookieBanner,
  },
  watch: {
    selectedGenre() {},
    moviesData() {
      this.findMaxYearInMoviesData();
      this.findMinYearInMoviesData();
      this.mapAllYearsFromMoviesData();
      
    },
  },
};
</script>

<template>
  <Header />
  <Content />
  <SearchBar
    :moviesData="moviesData"
    :moviesGeners="moviesGeners"
    :allYears="allYears"
    :maxYear="maxYear"
    :minYear="minYear"
    :handleOnOffMovie="handleOnOffMovie"
    :modal="modal"
    :handleAddMovie="handleAddMovie"
    :getData="getData"
    
  />

  <CookieBanner/>
  
  <div class="flex justify-center">
    <div
      class="film-container flex flex-wrap justify-center max-w-6xl"
      onsubmit="setTimeout(function(){window.location.reload();},10);"
    >
      
    </div>
  </div>
  <Footer />
  
</template>

<style>
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer components {
  .nav_a {
    @apply mr-4 hover:text-blue-600 hover:bg-slate-50 transition duration-150 ease-in-out py-3 px-1 rounded-xl;
  }
}

html {scroll-behavior: smooth;}

* {
  font-family: "Inter", sans-serif;
}

.py-2-5 {
  padding-top: 0.625rem;
  padding-bottom: 0.625rem;
}

.border-15px {
  border: 1rem solid #60a5fa;
}

.border-15px2 {
  border: 1rem solid #1e3a8a;
}
.mr-buttons {
  margin-right: 30.5rem;
}
.button-lightblue {
  background-color: #60a5fa;
}
.button-darkblue {
  background-color: #1e3a8a;
}
</style>
