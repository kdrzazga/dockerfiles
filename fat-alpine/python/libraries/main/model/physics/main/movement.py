import math

GRAVITY = 9.8


class Physics:
    @staticmethod
    def calculate_distance(x1, y1, x2, y2):
        return math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

    @staticmethod
    def calculate_distance_way(acceleration, time):
        return acceleration * time ** 2/2

    @staticmethod
    def calculate_time(distance, speed):
        return distance / speed

    @staticmethod
    def calculate_acceleration(initial_velocity, final_velocity, time):
        return (final_velocity - initial_velocity) / time

    @staticmethod
    def calculate_velocity(initial_velocity, acceleration, time):
        return initial_velocity + acceleration * time

    @staticmethod
    def calculate_final_velocity(initial_velocity, acceleration, distance):
        return math.sqrt(initial_velocity ** 2 + 2 * acceleration * distance)

    @staticmethod
    def calculate_work(force, distance):
        return force * distance

    @staticmethod
    def calculate_power(work, time):
        return work / time

    @staticmethod
    def calculate_force(mass, acceleration):
        return mass * acceleration

    @staticmethod
    def calculate_momentum(mass, velocity):
        return mass * velocity

    @staticmethod
    def calculate_kinetic_energy(mass, velocity):
        return 0.5 * mass * velocity ** 2

    @staticmethod
    def calculate_potential_energy(mass, height):
        return mass * GRAVITY * height

    @staticmethod
    def calculate_spring_energy(k, x):
        return 0.5 * k * x ** 2
