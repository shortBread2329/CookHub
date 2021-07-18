<template>
<div id="vue" class="card m-3">
<div class='card-header'>
  <div class="form-row">
  <div class="form-group col-md-6">
    <input type="text" class="form-control" id="title" placeholder="レシピ名" v-model="title">
  </div>
  </div>

  <div class="form-row">
    <div class="form-group col-md-6">
      <input type="text" class="form-control" id="introduction" placeholder="レシピの説明" v-model="introduction">
    </div>

    <div class="custom-file form-group col-md-6">
      <input type="file" class="custom-file-input" id="post_recipe_image" aria-describedby="inputGroupFileAddon04" @change="onImageUploaded">
      <label class="custom-file-label" for="post_recipe_image">写真を選択できます</label>
    </div>
    
  </div>
</div>

<div class='card-body'>
  <div class="form-row">
    <label>材料</label>
    <div class="form-group col-md-5">
      <input type="text" class="form-control" id="ingredient" placeholder="材料" v-model="ingredient">
    </div>
    <div class="form-group col-md-4">
      <input type="text" class="form-control" id="amount" placeholder="分量" v-model="amount">
    </div>
    <div class="form-group col-md-2">
      <input type="text" class="form-control" id="unit" placeholder="単位" v-model="unit">
    </div>
  </div>
  <div class="form-group col-md-1">
    <button type="button" class="btn btn btn-outline-dark" value="追加" @click="addIngredients();">追加</button>
  </div>
</div>
<div class='card-footer'>
  <div class="form-group">
    <label>作り方</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="作り方" v-model="procedure">
    <div v-for="value in ingredients" :value="value" :key="value.body" class="card-body">
      <p class="card-text">{{ value.ingredient }} : {{ value.amount }}{{ value.unit }}</p>
      <button type="button" class="btn btn btn-outline-dark" value="削除" >材料削除</button>
    </div>
    <div class="form-group col-md-1">
      <button type="button" class="btn btn btn-outline-dark" value="追加" @click="addProcedure();">追加</button>
    </div>
  </div>
</div>

<div class="card md-3 mr-3 ml-3">
  <img class="card-img-top" v-bind:src="post_recipe_image" alt="Card image cap">
  <div class='card-header'>
    <h5 class="card-title">{{ title }}</h5>
    <p class="card-text">{{ introduction }}</p>
  </div>
  <div v-for="value in procedures" :value="value" :key="value.ingredient" class="card-body">
    <p class="card-text">{{ value.body }}</p>
    <div v-for="value in value.ingredients" :value="value" :key="value.body" class="card-body">
      <p class="card-text">{{ value.ingredient }} : {{ value.amount }}{{ value.unit }}</p>
    </div>
    <button type="button" class="btn btn btn-outline-dark" value="削除" >手順削除</button>
  </div>
</div>
<div class="form-group col-md-3">
  <button type="button" class="btn btn btn-dark" @click="post">レシピを公開</button>
</div>
<div class="form-group col-md-3">
  <button type="button" class="btn btn btn-outline-dark" @click="update">下書きに保存</button>
</div>

</div>
</template>

<script>
import Vue from 'vue';
import axios from 'axios';

export default Vue.extend({
  data: function () {
    return {
      title:view.title,
      introduction:view.introduction,
      post_recipe_image:view.post_recipe_image,
      procedures:view.procedures,
      procedure:"",
      ingredients:[],
      ingredient:"",
      amount:"",
      unit:"",
    }
  },
  methods: {
    addIngredients(){
      this.ingredients.push({
        ingredient: this.ingredient,
        amount: this.amount,
        unit: this.unit,
      });
      this.ingredient = '';
      this.amount = '';
      this.unit = '';
    },
    addProcedure(){
      this.procedures.push({
        body: this.procedure,
        ingredients:this.ingredients,
      });
      this.procedure = '';
      this.ingredients=[];
    },
    post(){
      console.log(this.procedures);
      let testdata = [
        {
          body:"鍋に下記材料を入れ混ぜます。",
          ingredients:[
            {ingredient:"卵",amount:"1",unit:"こ"},
            {ingredient:"牛乳",amount:"100",unit:"cc"},
            {ingredient:"小麦粉",amount:"30",unit:"g"},
          ]
        },
        {
          body:"火にかけとろみがついたら完成です。",
          ingredients:[
          ]
        },
      ];
      // this.procedures = testdata;
      axios.post('/post_recipes',{
        utf8:"✓",
        authenticity_token:document.querySelector('meta[name="csrf-token"]').content,
        post_recipe: {
          title:"カスタードクリーム",
          introduction:"あいうえお",
          post_recipe_image:this.post_recipe_image,
          procedures:this.procedures,
        },
        post:"レシピを公開",
      })

    },
    update(){
      console.log(this.procedures);
    },
    onImageUploaded(e) {
      // event(=e)から画像データを取得する
      let image = e.target.files[0]
      this.createImage(image)
    },
    createImage(image) {
      let reader = new FileReader()
      // imageをreaderにDataURLとしてattachする
      reader.readAsDataURL(image)
      // readAdDataURLが完了したあと実行される処理
      reader.onload = () => {
        this.post_recipe_image = reader.result
      }
    }
  },
});
</script>

<style scoped>
</style>
