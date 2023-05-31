<script>
import AddMovie from './AddMovie.vue';


export default {
  data() {
        return {
          moviesData: [],
          moviesGeners: [],
          search:'',
          filtered:this.moviesData
        };
    },
  props:['moviesGeners', 'allYears', 'maxYear', 'minYear','moviesData','filtered','handleOnOffMovie','modal','handleAddMovie'],
  methods: {
    
        find() {
  const search = this.search;//title, year, genre, summary, image,quality,"length",trailer
  
  switch (search) {
    case 'akcion':
    this.filtered = this.moviesData.filter((movie) => 
    movie.genre == 1 
  );
      console.log(this.search)
      break;
    case 'fantasi':
    this.search=2
      break;
    case 'horror':
    this.search=3
      break;
    case 'science fiction':
    this.search=4
      break;
    case 'mystery':
    this.search=5
      break;
    case 'comedy':
    this.search=6
      break;
    case 'thriller':
    this.search=7
      break;
    case 'animated':
    this.search=8
      break;
    default:
      break;
  }
  
  this.filtered = this.moviesData.filter((movie) => 
    movie.title == search ||
    movie.id == search ||
    movie.year == search ||
    movie.genre == search ||
    movie.summary == search ||
    movie.quality == search ||
    movie.length == search
  );
  for (let index = 0; index < this.filtered.length; index++) {
    console.log(this.filtered[index].title);
  }
  
},
  },
  components: {
    AddMovie
  },
  watch: {
    filtered() {
      // The component will automatically re-render when the filtered array changes
    }
  }
}


</script>

<template>
  <div class="container mx-auto">
    <div class="flex justify-center mt-24">
      <input type="text" onkeyup='find()' v-model="search" placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
      <button type="submit" class="bg-blue-400 px-16 rounded-r-xl" @click="find">
        <i class="fa fa-search text-white fa-lg"></i>
      </button>
    </div>
    <form action="" class="flex justify-between mt-6">
      <select id="genres" class="border border-slate-400 rounded-md cursor-pointer px-3 py-2 text-slate-400 focus:text-black transition-colors">
        <option value="0">All</option>
        <option v-for="genre in moviesGeners" :value="genre.id">{{ genre.title }}</option>
      </select>
      <div>
        <select id="YearsFrom" class="">
          <option value="0">FROM: {{ minYear }}</option>
          <option v-for="year in allYears" :value="year">{{ year }}</option>
        </select>
        <select id="YearsTo" class="">
          <option value="0">TO: {{ maxYear }}</option>
          <option v-for="year in allYears" :value="year">{{ year }}</option>
        </select>
      </div>
    </form>
  </div>
  <AddMovie 
    :moviesGeners="moviesGeners"
    :allYears="allYears"
    :maxYear="maxYear"
    :minYear="minYear"
    :handleOnOffMovie="handleOnOffMovie"
    :modal="modal"
    :handleAddMovie="handleAddMovie"/>
</template>
