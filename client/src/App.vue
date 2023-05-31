<script>
import Header from "./components/Header.vue";
import Content from "./components/Content.vue";
import SearchBar from "./components/Searchbar.vue";
import Footer from "./components/Footer.vue";
import Pages from "./components/Pages.vue";
import MovieCard from "./components/MovieCard.vue";

export default {
  data() {
    return {
      moviesData: [],
      moviesGeners: [],
      maxYear: 0,
      minYear: 0,
      allYears: [],
      showModal: true,
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
    async handleAddMovie() {
      this.showModal = !this.showModal;
      const movieData = {
        title: this.title,
        year: this.releaseDate,
        genre: this.selectedGenre,
        summary: this.summary,
        image: this.image,
        quality: this.quality,
        length: this.length,
        trailer: this.trailer,
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
      console.log("getData")
        this.getData()
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
    Pages,
    MovieCard,
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
    :moviesGeners="moviesGeners"
    :allYears="allYears"
    :maxYear="maxYear"
    :minYear="minYear"
  />
  <div class="">
    <div
      v-if="showModal"
      class="bg-slate-100 container mx-auto w-1/3 shadow-2xl"
    >
      <div class="flex flex-col justify-center mx-10">
        <label class="mt-5">Film title</label>
        <input
          type="text"
          v-model="title"
          id="title"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
          placeholder="Type in a movie name"
        />

        <label class="mt-5">Relese date</label>
        <input
          type="number"
          v-model="releaseDate"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
        />

        <label class="mt-5">Genre</label>
        <form action="" class="">
          <select
            v-model="selectedGenre"
            id="genres"
            class="mt-4 py-2 px-4 border border-slate-400 rounded w-full"
          >
            <option
              v-for="genre in moviesGeners"
              :value="genre.id"
              :key="genre.id"
            >
              {{ genre.title }}
            </option>
          </select>
        </form>

        <label class="mt-5">Summary</label>
        <input
          type="text"
          v-model="summary"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
          placeholder="Type in a brief summary"
        />

        <label class="mt-5">Poster</label>
        <input
          type="url"
          v-model="image"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
          placeholder="URL"
        />

        <label class="mt-5">Quality</label>
        <input
          type="text"
          v-model="quality"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
          placeholder="HD | FHD | 4K"
        />

        <label class="mt-5">Length (min)</label>
        <input
          type="number"
          v-model="length"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
        />

        <label class="mt-5">Trailer</label>
        <input
          type="url"
          v-model="trailer"
          class="mt-4 py-2 px-4 border border-slate-400 rounded"
          placeholder="URL"
        />

        <div class="my-6 text-center">
          <button
            class="px-4 py-3 bg-red-400 border border-red-600 hover:bg-red-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white mr-5"
            @click="handleOnOffMovie"
          >
            Cancel
          </button>
          <button
            class="px-6 py-3 bg-green-400 border border-green-600 hover:bg-green-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white"
            @click="handleAddMovie"
          >
            Save
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="">
    <button
      v-if="!showModal"
      class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"
      @click="handleOnOffMovie"
    >
      Add Movie
    </button>
  </div>

  <div class="flex justify-center">
    <div
      class="film-container flex flex-wrap justify-center max-w-6xl"
      onsubmit="setTimeout(function(){window.location.reload();},10);"
    >
      <MovieCard :moviesData="moviesData" :moviesGeners="moviesGeners" />
    </div>
  </div>
  <Pages />
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
