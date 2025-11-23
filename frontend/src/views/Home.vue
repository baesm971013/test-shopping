<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h1 class="text-center mb-8">TETO SHOP</h1>
        <p class="text-center text-h6 mb-8">테토샵</p>
        <div class="text-center mb-4">
          <v-btn @click="initData" color="success" class="mr-2">테스트 데이터 생성</v-btn>
          <v-btn @click="loadProducts" color="primary">상품 새로고침</v-btn>
        </div>
      </v-col>
    </v-row>

    <v-row v-if="loading">
      <v-col cols="12" class="text-center">
        <v-progress-circular indeterminate color="primary"></v-progress-circular>
        <p>데이터 로딩 중...</p>
      </v-col>
    </v-row>

    <v-row v-else>
      <v-col cols="12" md="4" v-for="product in products" :key="product.productId">
        <v-card>
          <div class="pa-4 text-center" style="height: 200px; background-color: #f5f5f5; display: flex; align-items: center; justify-content: center;">
            <span class="text-h4">상품 이미지</span>
          </div>
          <v-card-title>{{ product.name }}</v-card-title>
          <v-card-text>
            <p>{{ product.description }}</p>
            <p class="text-h6 text-primary">₩{{ Number(product.price).toLocaleString() }}</p>
            <p class="text-caption">재고: {{ product.stock }}개</p>
          </v-card-text>
          <v-card-actions>
            <v-btn color="primary" variant="outlined">장바구니</v-btn>
            <v-btn color="primary">구매하기</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>

    <v-row v-if="!loading && products.length === 0">
      <v-col cols="12" class="text-center">
        <p class="text-h6">상품이 없습니다. 테스트 데이터를 생성해주세요!</p>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { productApi } from '../services/api'

export default {
  name: 'Home',
  data() {
    return {
      products: [],
      loading: false
    }
  },
  mounted() {
    this.loadProducts()
  },
  methods: {
    async loadProducts() {
      this.loading = true
      try {
        const response = await productApi.getAllProducts()
        this.products = response.data
      } catch (error) {
        console.error('상품 로딩 실패:', error)
        alert('상품 데이터를 불러오지 못했습니다.')
      } finally {
        this.loading = false
      }
    },
    async initData() {
      try {
        await productApi.initProducts()
        alert('테스트 데이터 생성 완료!')
        this.loadProducts()
      } catch (error) {
        console.error('데이터 생성 실패:', error)
        alert('데이터 생성에 실패했습니다.')
      }
    }
  }
}
</script>