<template>
    <div class="mt-24 container mx-auto flex justify-center">
        <div id="new" class="absolute z-1" >
            <div v-on:click="focusNewest(clickedBool)" class="bg-blue-400 w-48 text-center py-3 rounded-t-lg text-white">NEWEST</div>
            <div class="border-blue-400 border-4 bg-blue-400 border-15px shadow-xl">
                <iframe width="840" height="472.5" src="https://www.youtube.com/embed/qEVUtrk8_B4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
        </div>
        <div id="rated" class="absolute -z-1">
            <div v-on:click="focusRated(clickedBool)" class="bg-blue-900 w-48 text-center py-3 rounded-t-lg text-white ml-48">TOP RATED</div>
            <div class="border-blue-900 border-4 bg-blue-900 border-15px2 shadow-xl">
                <iframe width="840" height="472" src="https://www.youtube.com/embed/d9MyW72ELq0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
        </div>
    </div>

  </template>

  <script setup>

    let clickedBool = false;

    function focusNewest(clickedBool) {
       // const newest = document.getElementById("new")
       clickedBool = true;

       clickedBool ? document.getElementById("new").style.zIndex = -1 : document.getElementById("rated").style.zIndex = 1;

       console.log(clickedBool)
}
    function focusRated(clickedBool) {
        clickedBool = true;

        clickedBool ? document.getElementById("rated").style.zIndex = -1 : document.getElementById("new").style.zIndex = 1;

        console.log(clickedBool)
        /*
  document.getElementById("new").style.zIndex = -10;
  document.getElementById("rated").style.zIndex = 10;
  */
}

</script>