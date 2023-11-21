% Traveling Salesman Problem with Brute Force

% Define cities and distances between them.
city_distance(city1, city2, 10).
city_distance(city1, city3, 15).
city_distance(city1, city4, 20).
city_distance(city2, city3, 35).
city_distance(city2, city4, 25).
city_distance(city3, city4, 30).

% Entry point for the TSP solver.
tsp(StartCity, OptimalTour, MinDistance) :-
    findall(City, city_distance(StartCity, City, _), Cities),
    permutation(Cities, Permutation),
    calculate_distance([StartCity | Permutation], Distance),
    MinDistance is Distance,
    OptimalTour = [StartCity | Permutation].

% Calculate the total distance of a tour.
calculate_distance([_], 0).
calculate_distance([City1, City2 | Rest], TotalDistance) :-
    city_distance(City1, City2, Distance),
    calculate_distance([City2 | Rest], RemainingDistance),
    TotalDistance is Distance + RemainingDistance.

% Example query
% Replace 'city1' with the starting city of your choice.
% ?- tsp(city1, Tour, Distance).
