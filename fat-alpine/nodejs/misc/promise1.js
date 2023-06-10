function fetchData() {
  fetch('http://localhost:8080/')
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not OK');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.log('Error:', error);
    });
}

fetchData();
