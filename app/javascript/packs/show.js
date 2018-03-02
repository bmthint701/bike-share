// import moment from 'momentjs'

console.log("yay1")

const year_start = document.getElementById("booking_start_date_1i")
const month_start = document.getElementById("booking_start_date_2i")
const day_start = document.getElementById("booking_start_date_3i")
const hour_start = document.getElementById("booking_start_date_4i")
const month_end = document.getElementById("booking_end_date_2i")
const day_end = document.getElementById("booking_end_date_3i")
const hour_end = document.getElementById("booking_end_date_4i")
const elements = [month_start, day_start, hour_start, month_end, day_end, hour_end]

elements.forEach((element) => {
  element.addEventListener('change', (event) => {
    // console.log("<%= j DateTime.new(year_start) %>")
    console.log("yay")


    // document.getElementById(ingredientElement).value = '';
    // document.getElementById(descriptionElement).value = '';
    // hiddenDoses[counter].classList.add('hidden');
  });
});
