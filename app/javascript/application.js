var toggleButton = document.querySelector('.custom-popup-toggle');
var closeButton = document.querySelector('.custom-popup-close');
var popup = document.querySelector('#popup');

toggleButton.addEventListener('click', function(e) {
  e.preventDefault();
  popup.classList.toggle('hidden');
});

closeButton.addEventListener('click', function(e) {
  e.preventDefault();
  popup.classList.add('hidden');
});
