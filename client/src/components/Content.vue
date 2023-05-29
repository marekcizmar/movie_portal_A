<template>
    <div class="mt-24 container mx-auto ">
      <div class="flex ml-buttons">
        <button
          :class="{
            'bg-blue-400': activeTab === 'tab1',
            'button-lightblue': activeTab !== 'tab1'
          }"
          @click="activeTab = 'tab1'"
          class="py-2 px-4 w-48 py-3 rounded-t-lg text-white"
        >
        NEWEST
        </button>
        <button
          :class="{
            'bg-blue-900': activeTab === 'tab2',
            'button-darkblue': activeTab !== 'tab2'
          }"
          @click="activeTab = 'tab2'"
          class="py-2 px-4 w-48 py-3 rounded-t-lg text-white"
        >
        TOP RATED
        </button>
      </div>
  
      <div v-if="activeTab === 'tab1'" class="flex justify-center ">
        <div class="border-blue-400 border-4 bg-blue-400 border-15px shadow-xl">
                <iframe width="840" height="472.5" src="https://www.youtube.com/embed/qEVUtrk8_B4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
      </div>
      <div v-if="activeTab === 'tab2'" class="flex justify-center ">
        <div class="border-blue-900 border-4 bg-blue-900 border-15px2 shadow-xl">
                <iframe width="840" height="472" src="https://www.youtube.com/embed/d9MyW72ELq0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        activeTab: 'tab1'
      };
    }
  };
  </script>