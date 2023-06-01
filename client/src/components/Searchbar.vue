<script>
import AddMovie from './AddMovie.vue';
import MovieCard from './MovieCard.vue';

export default {
  
  data() {
        return {
          
          moviesGeners: [],
          search:'',
          filtered:this.moviesData,
          selectedGenre:0,
          n:0,
          minimalYear:this.minYear,
          maximalYear:this.maxYear,
          min:0,
          max:0

        };
    },props:['moviesGeners', 'allYears', 'maxYear', 'minYear','moviesData','handleOnOffMovie','modal','handleAddMovie','filtered','getData'],

  methods: {
    
    async find() {
      await this.getData();
      const search = this.search;

      switch (search) {
        case '0':
          this.filtered = this.moviesData
        break;
        case 'akcion':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 1 
          );
          console.log(this.search)
          break;
        case 'fantasi':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 2
          );
          break;
        case 'horror':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 3 
          );
          break;
        case 'science fiction':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 4 
          );
          break;
        case 'mystery':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 5 
          );
          break;
        case 'comedy':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 6 
          );
          break;
        case 'thriller':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 7 
          );
          break;
        case 'animated':
          this.filtered = this.moviesData.filter((movie) => 
            movie.genre == 8 
          );
          break;
        case '':
          if (this.selectedGenre<1) {
            this.filtered = this.moviesData
          } else {
            this.filtered = this.moviesData.filter((movie) =>
              movie.genre == this.selectedGenre 
            );
          }
        
        
          break;
          
        default:
          if (search<=8) {
            this.filtered = this.moviesData.filter((movie) =>
              movie.genre == search 
            );
          }else{
            console.log(this.selectedGenre)
            this.filtered = this.moviesData.filter((movie) =>
              movie.genre == search || 
              movie.title.toLowerCase().includes(search) ||
              movie.year == search ||
              movie.summary.toLowerCase().includes(search) ||
              movie.quality == search ||
              movie.length+"min" == search ||
              movie.length+"m" == search
            );
          }
          break;
      }
      
      for (let index = 0; index < this.filtered.length; index++) {
        console.log(this.filtered[index].title + ' ' + this.filtered[index].genre);
      }
      
      if (this.minimalYear<=1) {
        this.minimalYear=this.minYear
      }
      if (this.maximalYear<=1) {
        this.maximalYear=this.maxYear
      }
      this.filtered = this.filtered.filter((movie) => 
        movie.year >= this.minimalYear &&
        movie.year <= this.maximalYear 
      );
      this.search=''
    },
    clear(){
      this.selectedGenre=0
      this.minimalYear=this.minYear
      this.maximalYear=this.maxYear
      this.find();
    }
  },
  components: {
    AddMovie,
    MovieCard
  },
  watch: {
    filtered() {
      
    },
    find(){
      
    },
    selectedGenre(newValue) {
            console.log(newValue);
            this.search=newValue
            this.find(newValue);
    },
    maximalYear(maxValue){
      
      console.log(this.minimalYear+' '+maxValue);
      this.find(this.minimalYear,maxValue)
    },
    minimalYear(minValue){

      
      console.log(this.minimalYear+' '+this.maximalYear);
      this.find(minValue,this.maximalYear)
    },
    clear(){
      
    }
  },
  mounted() {
    this.find(); 
  },
}


</script>

<template>
  <div id="movies1" class="flex justify-center pt-32">
    <i class="fa fa-film text-8xl text-blue-400"></i>
    <h1 class="text-3xl pt-7 text-blue-900 pl-6 font-medium"><a href="">FilmFusion</a></h1>
  </div>
  <div class="container mx-auto">
    <div class="flex justify-center pt-12">
      <input type="text" v-model="search"  placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
      <button type="submit" class="bg-blue-400 px-16 rounded-r-xl" @click="find" >
        <i class="fa fa-search text-white fa-lg"></i>
      </button>
    </div>
    <form action="" class="flex justify-between mt-4">
      <div class="flex">
        <h1 class="mr-4 mt-6">Genres: </h1>
        <form action="" class="">
          <select v-model="selectedGenre" id="genres" class="mt-4 py-2 px-4 border border-slate-400 rounded mr-6">
              <option value="0">All</option>
              <option v-for="genre in moviesGeners" :value="genre.id" :key="genre.id">{{ genre.title }}</option>
            </select>
        </form>
        <h1 class="ml-3 mr-4 mt-6">Years: </h1>
        <div>
          <div class="mt-4 py-2 px-4 border border-slate-400 rounded mr-2">
              FROM:
            <select id="YearsFrom"  v-model="minimalYear">
              <option v-for="year in allYears.slice().reverse()" :value="year" :key="year">{{ year }}</option>
            </select>
        </div>
        </div>
        <div>
          <div class="mt-4 py-2 px-4 border border-slate-400 rounded">
              TO: 
            <select id="YearsTo"  v-model="maximalYear">
              <option v-for="year in allYears" :value="year" :key="year">{{ year }}</option>
            </select>
          </div>
          
        </div>
        <div>
          <button class="py-2 px-4 border border-slate-400 rounded m-4" @click="clear" >Clear All</button>
        </div>
      </div>
      <AddMovie 
        :moviesGeners="moviesGeners"
        :allYears="allYears"
        :maxYear="maxYear"
        :minYear="minYear"
        :handleOnOffMovie="handleOnOffMovie"
        :modal="modal"
        :handleAddMovie="handleAddMovie"/>
    </form>
  </div>
  <div class="flex justify-center mt-14">
    <div class="film-container flex flex-wrap justify-center max-w-6xl" onsubmit="setTimeout(function(){window.location.reload();},10);">
      <MovieCard :moviesData="this.filtered" :moviesGeners="moviesGeners" />
    </div>
  </div>
</template> 
