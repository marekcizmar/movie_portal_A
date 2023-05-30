<template>
    <div class="mt-24 container mx-auto ">
      <div class="flex justify-center mr-buttons">
        <button
          :class="{
            'bg-blue-400': activeTab === 'tab1',
            'button-lightblue': activeTab !== 'tab1'
          }"
          @click="activeTab = 'tab1'"
          class="py-2 px-4 w-48 py-3 rounded-t-lg text-white">
        TOP WATCHED
        </button>
        <button
          :class="{
            'bg-blue-900': activeTab === 'tab2',
            'button-darkblue': activeTab !== 'tab2'
          }"
          @click="activeTab = 'tab2'"
          class="py-2 px-4 w-48 py-3 rounded-t-lg text-white">
        TOP RATED
        </button>
      </div>
      <div v-if="activeTab === 'tab1'" class="flex justify-center">
        <div class="relative left-48 border-blue-400 border-4 bg-blue-400 border-15px shadow-xl">
                <iframe width="840" height="472.5" src="https://www.youtube.com/embed/qEVUtrk8_B4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
            <button :class="{
            'bg-blue-400': activeTab === 'tab5',
            'button-lightblue': activeTab !== 'tab5'
          }"
          @click="activeTab = 'tab5'" 
          class="relative bg-blue-400 h-20 w-48 rounded-r-md text-white left-48">2. TOP WATCHED</button><br>
            <button :class="{
            'bg-blue-400': activeTab === 'tab6',
            'button-lightblue': activeTab !== 'tab6'
          }" 
          @click="activeTab = 'tab6'" 
        
          class="relative top-24 bg-blue-400 h-20 w-48 rounded-r-md text-white">3. TOP WATCHED</button>
      </div>
      <div v-if="activeTab === 'tab2'" class="flex justify-center">   
        <div class="relative left-48 border-blue-900 border-4 bg-blue-900 border-15px2 shadow-xl">
                <iframe width="840" height="472" src="https://www.youtube.com/embed/d9MyW72ELq0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div> 
            <button :class="{
            'bg-blue-900': activeTab === 'tab3',
            'button-darkblue': activeTab !== 'tab3'
          }"
          @click="activeTab = 'tab3'" 
        class="relative left-48 bg-blue-900 h-20 w-48 rounded-r-md text-white"> 
          2. TOP RATED
        </button><br>
        <button :class="{
            'bg-blue-900': activeTab === 'tab4',
            'button-darkblue': activeTab !== 'tab4'
          }" 
          @click="activeTab = 'tab4'"
          
          class="relative top-24 bg-blue-900 h-20 w-48 rounded-r-md text-white">
          
          3. TOP RATED
        </button>
      </div>

      <div v-if="activeTab === 'tab3'" class="flex justify-center">
        <div class="border-blue-900 border-4 bg-blue-900 border-15px2 shadow-xl">
                <iframe width="840" height="472"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div> 
      </div>

      <div v-if="activeTab === 'tab4'" class="flex justify-center">
        <div class="border-blue-900 border-4 bg-blue-900 border-15px2 shadow-xl">
                <iframe width="840" height="472"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div> 
      </div>

      <div v-if="activeTab === 'tab5'" class="flex justify-center">
        <div class="border-[16px] bg-blue-400 border-blue-400 shadow-xl">
                <iframe width="840" height="472"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div> 
      </div>

      <div v-if="activeTab === 'tab6'" class="flex justify-center">
        <div class="border-[16px] bg-blue-400 border-blue-400 shadow-xl">
                <iframe width="840" height="472"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
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