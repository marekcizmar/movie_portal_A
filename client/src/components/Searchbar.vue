<script>
export default {
 props:['moviesGeners', 'allYears', 'maxYear', 'minYear'],
}
</script>

<template>
  <div class="container mx-auto">
    <div class="flex justify-center mt-24">
      <input type="text" placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
      <button type="submit" class="bg-blue-400 px-16 rounded-r-xl">
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
</template> 

