<script>
  import Header from './components/Header.vue'
  import Content from './components/Content.vue'
  import SearchBar from './components/Searchbar.vue'
  import Footer from './components/Footer.vue'
  import Pages from './components/Pages.vue'
  import FilmContainer from './components/FilmContainer.vue'

  export default {
  data() {
    return {
      moviesData: [],
      moviesGeners: [],
      maxYear: 0,
      minYear: 0,
      allYears: []
    };
  },
  methods: {
    async getData() {
      const res = await fetch('http://localhost:5000/movie');
      const finalRes = await res.json();
      this.moviesData = finalRes;
      console.log(finalRes);
    },
    async getDataGeners() {
      const res = await fetch('http://localhost:5000/genre');
      const finalRes = await res.json();
      this.moviesGeners = finalRes;
      console.log(finalRes);
    },
    findMaxYearInMoviesData() {
      if (this.moviesData.length === 0) {
        this.maxYear = 0;
        return;
      }

      const moviesYears = this.moviesData.map(movie => movie.year);
      this.maxYear = Math.max(...moviesYears);
      console.log(this.maxYear);
    },
    findMinYearInMoviesData() {
      if (this.moviesData.length === 0) {
        this.minYear = 0;
        return;
      }

      const moviesYears = this.moviesData.map(movie => movie.year);
      this.minYear = Math.min(...moviesYears);
      console.log(this.minYear);
    },
    mapAllYearsFromMoviesData() {
      this.allYears = [...new Set(this.moviesData.map(movie => movie.year))];
  //console.log(this.allYears);
}
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
    FilmContainer
  },
  watch: {
    selectedGenre() {
    },
    moviesData() {
      this.findMaxYearInMoviesData();
      this.findMinYearInMoviesData(); 
      this.mapAllYearsFromMoviesData();
    }
  }
};

</script>

<template>
  <Header/>
  <Content/>
  <SearchBar :moviesGeners="moviesGeners" :allYears="allYears" :maxYear="maxYear" :minYear="minYear"/>
  <FilmContainer :moviesData="moviesData" :moviesGeners="moviesGeners"/>
  <Pages/>
  <Footer/>
</template>

<style>
  @tailwind base;
  @tailwind components;
  @tailwind utilities;

  @layer components{
    .nav_a {
      @apply mr-4 hover:text-blue-600 hover:bg-slate-50 transition duration-150 ease-in-out py-3 px-1 rounded-xl
    }
  }

  * {
    font-family: 'Inter', sans-serif;
  }
  
  .py-2-5 {
    padding-top: 0.625rem;
    padding-bottom: 0.625rem;
  }

  .border-15px{
    border: 1rem solid #60a5fa;
  }

  .border-15px2{
    border: 1rem solid #1e3a8a;
  }
  .mr-buttons{
    margin-right: 30.5rem;
  }
  .button-lightblue{
    background-color: #60a5fa;
  }
  .button-darkblue{
    background-color: #1e3a8a;
  }

</style>
