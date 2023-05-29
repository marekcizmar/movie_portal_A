<script>
  import Header from './components/Header.vue'
  import Content from './components/Content.vue'
  import SearchBar from './components/Searchbar.vue'
  import Footer from './components/Footer.vue'
  import Pages from './components/Pages.vue'
  import FilmContainer from './components/FilmContainer.vue'

  export default {
    data(){
        return{
            moviesData: [],
            moviesGeners: []
        }
    },
    methods: {
        async getData(){
            const res = await fetch('http://localhost:5000/movie')
            const finalRes = await res.json()
            this.moviesData = finalRes
            //console.log(finalRes)
        },
        async getDataGeners(){
            const res = await fetch('http://localhost:5000/genre')
            const finalRes = await res.json()
            this.moviesGeners = finalRes
            //console.log(finalRes)
        }
    },
    mounted(){
        this.getData()
        this.getDataGeners()
    },
    components:{
      Header,
      Content,
      SearchBar,
      Footer,
      Pages,
      FilmContainer
    }
}


</script>

<template>
  <Header/>
  <Content/>
  <SearchBar :moviesGeners="moviesGeners"/>
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

  .border-left-1 {
    border-left: 1px solid rgb(225, 225, 225);
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

</style>
