<script>
export default {
    
    data(){
        return{
            showSumaty:false,
            showButton1:false,
            showButton2:false,
            showButton3:false,

        }
    },
    
    methods: {
        onOff(){
            this.showSumaty=!this.showSumaty
        },
        onOffQuestion(button){
            switch (button) {
                case 1:
                this.showButton1=!this.showButton1
                    break;
                case 2:
                this.showButton2=!this.showButton2
                    break;
                case 3:
                this.showButton3=!this.showButton3
                    break;
                    
                default:
                    break;
            }
            
        }
    },
    
      
};


</script>

<template>
    <div>
        <footer class="shadow-2xl p-8 text-center">
            <span class="text-gray-500">© 2023 FilmFusion</span>
            <div >
                <button v-if="!showSumaty" @click="onOff"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-2"> About Us </button>
                <div v-if="showSumaty" >
                    <div>
                        <button v-if="!showButton1" @click="onOffQuestion(1)"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-1"> What is our contact information ? </button>
                        <div v-if="showButton1" class="mt-4 py-2 px-4 border border-slate-400 rounded ">
                            <div >
                                <div class="mt-4 py-2 px-4   rounded mr-6 ">tel:+421 xxx xxx xxx </div>
                                <div class="mt-4 py-2 px-4  rounded mr-6">Email: fake@movies.never</div>
                            </div>
                            <button  @click="onOffQuestion(1)"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-4"> Close </button>
                        </div>
                    </div>
                    <div>
                        <button v-if="!showButton2" @click="onOffQuestion(2)"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-1"> What is our Company Name ? </button>
                        <div v-if="showButton2" class="mt-4 py-2 px-4 border border-slate-400 rounded">
                            <div>
                                <div id="movies1" class="flex justify-center pt-2 pb-2">
                                <i class="fa fa-film text-6xl text-blue-400"></i>
                                <h1 class="text-3xl pt-7 text-blue-900 pl-6 font-medium">FilmFusion</h1>
                                </div>
                            </div>
                            <button  @click="onOffQuestion(2)"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-4"> Close </button>
                        </div>
                    </div>
                    <div>
                        <button v-if="!showButton3" @click="onOffQuestion(3)"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-1"> Where is our Headquarters located ?</button>
                        <div v-if="showButton3" class="mt-4 py-2 px-4 border border-slate-400 rounded ">
                            <div class="mt-4 py-2 px-4   rounded mr-6 ">Location: FakeStreet 64</div>
                            <button  @click="onOffQuestion(3)"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-4"> Close </button>
                        </div>
                    </div>
                    <button  @click="onOff"  class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded m-1"> Close </button>
                </div>
                    
            </div>
        </footer>
        
    </div>
</template>