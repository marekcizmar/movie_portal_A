<script>
export default {
 props:['moviesGeners', 'allYears', 'maxYear', 'minYear'],
}
</script>

<template>
  <div class="container mx-auto mt-28">
    <div class="flex justify-center ">
      <i class="fa fa-film text-8xl text-blue-400"></i>
      <h1 class="text-3xl pt-7 text-blue-900 pl-6 font-medium"><a href="">FilmFusion</a></h1>
    </div>
    <div class="flex justify-center pt-10">
      <input type="text" placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
      <button type="submit" class="bg-blue-400 px-16 rounded-r-xl">
        <i class="fa fa-search text-white fa-lg"></i>
      </button>
    </div>
    <form action="" class="flex mt-6">
      <div class="pr-3 pt-2">Genres: </div>
      <select id="genres" class="border border-slate-400 rounded-lg cursor-pointer px-3 py-2 text-slate-400 focus:text-black transition-colors">
        <option value="0">All</option>
        <option v-for="genre in moviesGeners" :value="genre.id">{{ genre.title }}</option>
      </select>
      <div class="flex ml-7">
          <div class="mt-2 mr-4">Years:</div>
          <div class="flex border-1 border-slate-400 rounded-lg px-3">
          <div class="mt-2 font-medium">FROM:</div>
          <select id="YearsFrom" class="">
            <option value="0"> {{ minYear }}</option>
            <option v-for="year in allYears" :value="year">{{ year }}</option>
          </select>

        <div class="pt-2 ml-3 font-medium border-l-1 border-slate-400  pl-3" > TO:</div>
        <select id="YearsTo" class="">
          <option value="0"> {{ maxYear }}</option>
          <option v-for="year in allYears" :value="year">{{ year }}</option>
        </select>
      </div>
    </div>
    </form>
  </div>
</template> 

