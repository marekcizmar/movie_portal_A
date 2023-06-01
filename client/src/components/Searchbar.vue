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
          minimalYear:0,
          maximalYear:0,
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
    this.filtered = this.moviesData
    
      break;
      
    default:
    this.filtered = this.moviesData.filter((movie) => 
    movie.title.toLowerCase().includes(search.toLowerCase()) ||
    movie.year == search ||
    movie.genre == search ||
    movie.summary.toLowerCase().includes(search.toLowerCase()) ||
    movie.quality.toLowerCase() == search.toLowerCase() ||
    movie.length+"min" == search ||
    movie.length+"m" == search
  );
      break;
  }
  
  for (let index = 0; index < this.filtered.length; index++) {
    console.log(this.filtered[index].title);
  }
  
  if (this.minimalYear<=1) {
    this.minimalYear=2015
  }
  if (this.maximalYear<=1) {
    this.maximalYear=2022
  }
  this.filtered = this.filtered.filter((movie) => 
    movie.year >= this.minimalYear &&
    movie.year <= this.maximalYear 
  );
  this.search=''
},
 

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
    }
  },
  mounted() {
    this.find(); 
  },
}


</script>

<template>
  <div class="container mx-auto">
    <div class="flex justify-center mt-24">
      <input type="text" v-model="search"  placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
      <button type="submit" class="bg-blue-400 px-16 rounded-r-xl" @click="find" >
        <i class="fa fa-search text-white fa-lg"></i>
      </button>
    </div>
    <form action="" class="flex justify-between mt-4">
      <div class="flex">
        <form action="" class="">
          <select v-model="selectedGenre" id="genres" class="mt-4 py-2 px-4 border border-slate-400 rounded mr-6">
              <option value="0">All</option>
              <option v-for="genre in moviesGeners" :value="genre.id" :key="genre.id">{{ genre.title }}</option>
            </select>
        </form>
        <div>
          <select id="YearsFrom" class="mt-4 py-2 px-4 border border-slate-400 rounded" v-model="minimalYear">
          <option value="0">FROM: {{ minYear }}</option>
          <option v-for="year in allYears" :value="year" :key="year">{{ year }}</option>
        </select>
      </div>
    </div>
      </form>
      
      <div>
        <select id="YearsTo" class="mt-4 py-2 px-4 border border-slate-400 rounded" v-model="maximalYear">
          <option value="0">TO: {{ maxYear }}</option>
          <option v-for="year in allYears" :value="year" :key="year">{{ year }}</option>
        </select>
      </div>
      <AddMovie 
        :moviesGeners="moviesGeners"
        :allYears="allYears"
        :maxYear="maxYear"
        :minYear="minYear"
        :handleOnOffMovie="handleOnOffMovie"
        :modal="modal"
        :handleAddMovie="handleAddMovie"/>
    
  </div>
    <div class="flex justify-center mt-14">
    <div
      class="film-container flex flex-wrap justify-center max-w-6xl"
      onsubmit="setTimeout(function(){window.location.reload();},10);"
    >
      <MovieCard :moviesData="this.filtered" :moviesGeners="moviesGeners" />
    </div>
  </div>
</template> 
