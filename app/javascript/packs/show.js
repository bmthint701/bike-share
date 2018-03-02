import moment from 'moment'

console.log("yay1")

const year = document.getElementById("booking_start_date_1i")
const month_start = document.getElementById("booking_start_date_2i")
const day_start = document.getElementById("booking_start_date_3i")
const hour_start = document.getElementById("booking_start_date_4i")
const month_end = document.getElementById("booking_end_date_2i")
const day_end = document.getElementById("booking_end_date_3i")
const hour_end = document.getElementById("booking_end_date_4i")

const startDateElements = [month_start, day_start, hour_start]
const endDateElements = [month_end, day_end, hour_end]

let startDate = moment(new Date(year.value.toString(), month_start.value, day_start.value, hour_start.value))
let endDate = moment(new Date(year.value.toString(), month_end.value, day_end.value, hour_end.value))

startDateElements.forEach((element) => {
  element.addEventListener('change', (event) => {
    // console.log("<%= j DateTime.new(year_start) %>")
    console.log("yay1")
    startDate = moment(new Date(year.value.toString(), month_start.value, day_start.value, hour_start.value))

    calculateDiff();


    // document.getElementById(ingredientElement).value = '';
    // document.getElementById(descriptionElement).value = '';
    // hiddenDoses[counter].classList.add('hidden');
  });
});

endDateElements.forEach((element) => {
  element.addEventListener('change', (event) => {
    // console.log("<%= j DateTime.new(year_start) %>")
    console.log("yay2")

    console.log({year, month_end, day_end, hour_end})
    console.log(year.value, month_end.value, day_end.value, hour_end.value)
    console.log(new Date(year.value.toString(), month_end.value, day_end.value, hour_end.value))
    endDate = moment(new Date(year.value.toString(), month_end.value, day_end.value, hour_end.value))
    calculateDiff();

    // document.getElementById(ingredientElement).value = '';
    // document.getElementById(descriptionElement).value = '';
    // hiddenDoses[counter].classList.add('hidden');
  });
});

function calculateDiff() {
  console.log({startDate, endDate})
  if (startDate && endDate) {
    console.log(endDate.diff(startDate, 'hours'))
    const price = 500 * endDate.diff(startDate, 'hours')
    document.getElementById('price').innerText = price;
  }
}
