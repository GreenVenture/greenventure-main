<template>
  <div class="h-100 container wallet">
    <h4 class="my-3">
      Wallet : {{ walletdata.points }}
      <!-- <img src="src/assets/img/voucher.png" height="20" alt="" /> -->
    </h4>

    <h5>
      My Vouchers
      <!-- <img src="src/assets/img/voucher.png" height="30" alt="" /> -->
    </h5>
    <div class="row">
      <div
        v-for="myvouchers in walletdata.user_vouchers"
        :key="myvouchers.voucherID"
        class="col-xl-2 col-lg-3 col-md-4 col-6"
      >
        <div class="card border rounded">
          <!-- <img
            :src="getVoucherCodeWithoutNumbers(myvouchers.voucher_code)"
            class="card-img-top"
            height="70"
            alt="..."
          /> -->
          <div class="card-body row">
            <div class="col-12">
              <div class="card-title fw-bold">{{ myvouchers.voucher_code }}</div>
              <p class="card-text">{{ myvouchers.voucherID }}</p>
            </div>
            <button
              class="btn-primary w-25 text-white m-2 btn col use"
              data-bs-toggle="modal"
              :data-bs-target="'#use-' + myvouchers.voucherID"
            >
              Use
            </button>
            <div
              :id="'use-' + myvouchers.voucherID"
              class="modal fade"
              tabindex="-1"
              role="dialog"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-body text-dark">
                    <div v-if="useResult == ''" class="text-center">
                      Do you want to use the voucher with the code,
                      <div class="d-inline-block fw-bold">{{ myvouchers.voucher_code }}</div>
                      ?
                    </div>
                    <div v-else class="row">
                      <div class="text-success text-center">{{ useResult }}</div>
                      <div class="col-2"></div>
                      <!-- <img class="text-center col-8" src="src/assets/img/qr.png" alt="" /> -->
                      <div class="col-2"></div>
                    </div>
                  </div>
                  <div class="modal-body border-top">
                    <div class="row">
                      <div class="col-2"></div>
                      <button
                        type="button"
                        class="closeBtn col-3"
                        data-bs-dismiss="modal"
                        @click="reloadpage"
                      >
                        Close
                      </button>
                      <div class="col-2"></div>
                      <button
                        type="button"
                        :class="useResult != '' ? 'redeemBtnDisabled col-3' : 'redeemBtn col-3'"
                        :disabled="useResult != ''"
                        @click="use(myvouchers.voucher_code, walletdata)"
                      >
                        Use
                      </button>
                      <div class="col-2"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <h5 class="my-3">
        Vouchers shop
        <!-- <img src="src/assets/img/deal.png" height="30" alt="" /> -->
      </h5>
      <div
        v-for="vouchers in walletdata.available_vouchers"
        :key="vouchers.voucherID"
        class="col-xl-2 col-lg-3 col-md-4 col-6"
      >
        <div class="card border rounded">
          <!-- <img
            :src="getVoucherCodeWithoutNumbers(vouchers.voucherCode)"
            class="card-img-top"
            height="70"
            alt="..."
          /> -->
          <div class="card-body row">
            <div class="col-12">
              <div class="card-title fw-bold">{{ vouchers.voucherCode }}</div>
              <p class="card-text">Points required {{ vouchers.pointsRequired }}</p>
            </div>
            <button
              class="btn-primary w-25 text-white m-2 btn col use"
              data-bs-toggle="modal"
              :data-bs-target="'#detail-' + vouchers.voucherID"
            >
              See more
            </button>
            <div
              :id="'detail-' + vouchers.voucherID"
              class="modal fade"
              tabindex="-1"
              role="dialog"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5
                      id="exampleModalLabel"
                      class="modal-title text-dark fw-bold px-1"
                      :hidden="redemptionResult"
                    >
                      Wallet: {{ walletdata.points }} Points
                    </h5>
                  </div>
                  <div class="modal-body text-dark">
                    <div v-if="redemptionResult" class="text-success text-center">
                      {{ redemptionResult }}
                    </div>
                    <div v-else>
                      <!-- <img :src="'src/assets/img/' + vouchers.merchantName + '.png'" /> -->
                      <h5 class="opacity-50 px-1">{{ vouchers.voucherName }}</h5>
                      <div class="row my-3 px-1">
                        <!-- <img class="col-2 pe-0" src="src/assets/img/voucher.png" alt="" /> -->
                        <h6 class="col-4 d-inline-block my-auto fw-bold">Cost:</h6>
                        <h6 class="col-6 d-inline-block my-auto fw-bold">
                          {{ vouchers.pointsRequired }} Points
                        </h6>
                      </div>
                      <div class="row my-3 px-1">
                        <!-- <img class="col-2 pe-0" src="src/assets/img/voucher.png" alt="" /> -->
                        <h6 class="col-4 d-inline-block my-auto fw-bold">QTY:</h6>
                        <h6 class="col-6 d-inline-block my-auto fw-bold">
                          {{ vouchers.quantity }} Left
                        </h6>
                      </div>
                      <h6 class="mt-3 fw-bold px-1">Terms & Conditions:</h6>
                      <div class="mt-1 px-1">{{ vouchers.description }}</div>
                    </div>
                  </div>
                  <div class="modal-body border-top">
                    <div
                      v-if="walletdata.points < vouchers.pointsRequired ? true : false"
                      class="text-danger text-center mb-3"
                    >
                      You do not have enough points to redeem this voucher
                    </div>
                    <div class="row">
                      <div class="col-2"></div>
                      <button
                        type="button"
                        class="closeBtn col-3"
                        data-bs-dismiss="modal"
                        @click="reloadpage"
                      >
                        Close
                      </button>
                      <div class="col-2"></div>
                      <button
                        type="button"
                        :class="
                          walletdata.points < vouchers.pointsRequired || redemptionResult != ''
                            ? 'redeemBtnDisabled col-3'
                            : 'redeemBtn col-3'
                        "
                        :disabled="
                          (walletdata.points < vouchers.pointsRequired ? true : false) ||
                          redemptionResult != ''
                        "
                        @click="redeem(vouchers)"
                      >
                        Redeem
                      </button>
                      <div class="col-2"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

let redemptionResult = ref('')
let useResult = ref('')
const walletdata = ref([])

const userID = localStorage.getItem('userID')
const email = localStorage.getItem('email')

const state = {
  id: userID
}

function redeem(vouchers) {
  axios
    .post('http://localhost:5204/redeemVoucher', {
      user_ID: userID,
      voucherID: vouchers.voucherID,
      voucher_code: vouchers.voucherCode,
      voucher_amount: vouchers.pointsRequired,
      email: email
    })
    .then(function (response) {
      redemptionResult.value = response.data.data.returnMessage
    })
    .catch(function (error) {
      console.log(error)
    })
}

function use(myvouchers, walletdata) {
  let wal = walletdata.walletID
  console.log(wal)
  axios
    .post('http://localhost:5205/useVoucher', {
      walletID: wal,
      voucher_code: myvouchers,
      email: email
    })
    .then(function (response) {
      useResult.value = response.data.data.returnMessage
    })
    .catch(function (error) {
      console.log(error)
    })
}

function reloadpage() {
  location.reload()
  redemptionResult.value = ''
  useResult.value = ''
}

const postData = async () => {
  try {
    const response = await axios.post('http://localhost:5203/get_wallet_details', state)

    walletdata.value = response.data
    console.log(walletdata.value)
    // handle the response if needed
  } catch (error) {
    // handle the error if needed
  }
}

// function getVoucherCodeWithoutNumbers(voucherCode) {
//   return 'src/assets/img/' + voucherCode.replace(/\d/g, '') + '.png'
// }

onMounted(() => {
  postData()
})
</script>
