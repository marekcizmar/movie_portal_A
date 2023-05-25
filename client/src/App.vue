<script setup>
import Header from './components/Header.vue'
import FilmContainer from './components/FilmContainer.vue';
</script>

<template>
  <Header />
  <FilmContainer />
  
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


</style>
