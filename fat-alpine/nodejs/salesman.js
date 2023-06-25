// Define the distance matrix (representing the distances between cities)
const distanceMatrix = [
  [0, 10, 15, 20],
  [10, 0, 35, 25],
  [15, 35, 0, 30],
  [20, 25, 30, 0]
];

// Genetic Algorithm parameters
const populationSize = 100;
const generations = 100;

// Generate a random initial population
function generatePopulation(size) {
  const population = [];
  for (let i = 0; i < size; i++) {
    const chromosome = Array.from({ length: distanceMatrix.length }, (_, i) => i);
    shuffle(chromosome);
    population.push(chromosome);
  }
  return population;
}

// Perform a single-point crossover between two parent chromosomes
function crossover(parent1, parent2) {
  const cutoff = Math.floor(Math.random() * parent1.length);
  const child = parent1.slice(0, cutoff);
  for (const gene of parent2) {
    if (!child.includes(gene)) {
      child.push(gene);
    }
  }
  return child;
}

// Mutate a chromosome by swapping two random cities
function mutate(chromosome) {
  const mutated = [...chromosome];
  const index1 = Math.floor(Math.random() * mutated.length);
  let index2 = Math.floor(Math.random() * mutated.length);
  while (index1 === index2) {
    index2 = Math.floor(Math.random() * mutated.length);
  }
  [mutated[index1], mutated[index2]] = [mutated[index2], mutated[index1]];
  return mutated;
}

// Calculate the fitness (total distance) of a chromosome
function calculateFitness(chromosome) {
  let totalDistance = 0;
  for (let i = 0; i < chromosome.length - 1; i++) {
    const cityA = chromosome[i];
    const cityB = chromosome[i + 1];
    totalDistance += distanceMatrix[cityA][cityB];
  }
  return totalDistance;
}

// Select parents for the next generation using tournament selection
function selectParents(population, tournamentSize) {
  const parents = [];
  for (let i = 0; i < population.length; i++) {
    const tournament = getRandomSubset(population, tournamentSize);
    tournament.sort((a, b) => calculateFitness(a) - calculateFitness(b));
    parents.push(tournament[0]);
  }
  return parents;
}

// Generate the next generation of the population using crossover and mutation
function generateNextGeneration(population, mutationRate) {
  const parents = selectParents(population, 3);
  const nextGeneration = [];
  for (let i = 0; i < population.length; i++) {
    const parent1 = parents[Math.floor(Math.random() * parents.length)];
    const parent2 = parents[Math.floor(Math.random() * parents.length)];
    let child = crossover(parent1, parent2);
    if (Math.random() < mutationRate) {
      child = mutate(child);
    }
    nextGeneration.push(child);
  }
  return nextGeneration;
}

// Find the best solution (shortest distance) from a population
function findBestSolution(population) {
  let bestFitness = Infinity;
  let bestSolution;
  for (const chromosome of population) {
    const fitness = calculateFitness(chromosome);
    if (fitness < bestFitness) {
      bestFitness = fitness;
      bestSolution = chromosome;
    }
  }
  return bestSolution;
}

// Shuffle an array in-place using the Fisher-Yates algorithm
function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}

// Get a random subset of elements from an array
function getRandomSubset(array, size) {
  const shuffled = [...array];
  shuffle(shuffled);
  return shuffled.slice(0, size);
}

// Main function
function main() {
  let population = generatePopulation(populationSize);
  for (let generation = 0; generation < generations; generation++) {
    population = generateNextGeneration(population, 0.01);
    const bestSolution = findBestSolution(population);
    const bestFitness = calculateFitness(bestSolution);
    console.log(`Generation ${generation + 1}: Best Fitness = ${bestFitness}`);
  }
  const bestSolution = findBestSolution(population);
  console.log("Best Solution:", bestSolution);
}

// Run the program
main();
