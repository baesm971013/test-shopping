import axios from 'axios'

const API_BASE_URL = '/api'  // 프록시 사용

const api = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json'
  }
})

export const productApi = {
  // 모든 상품 조회
  getAllProducts() {
    return api.get('/products')
  },
  
  // 상품 상세 조회
  getProduct(id) {
    return api.get(`/products/${id}`)
  },
  
  // 테스트 데이터 생성
  initProducts() {
    return api.post('/products/init')
  }
}

export default api