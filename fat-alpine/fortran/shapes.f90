program shapes
  implicit none
  real :: radius, height, base1, base2, perimeter_circle, surface_circle, perimeter_trapezoid, surface_trapezoid
  real, parameter :: pi = 3.1415927
  
  ! Get user input
  write(*,*) "Enter the radius of the circle:"
  read(*,*) radius
  
  write(*,*) "Enter the height of the trapezoid:"
  read(*,*) height
  
  write(*,*) "Enter the length of the top base of the trapezoid:"
  read(*,*) base1
  
  write(*,*) "Enter the length of the bottom base of the trapezoid:"
  read(*,*) base2
  
  ! Calculate perimeter and surface area of circle
  perimeter_circle = 2.0 * pi * radius
  surface_circle = pi * radius ** 2
  
  ! Calculate perimeter and surface area of trapezoid
  perimeter_trapezoid = base1 + base2 + 2.0 * sqrt(height**2 + (base2-base1)**2)
  surface_trapezoid = 0.5 * (base1 + base2) * height
  
  ! Output results
  write(*,*) "Circle perimeter:", perimeter_circle
  write(*,*) "Circle surface area:", surface_circle
  
  write(*,*) "Trapezoid perimeter:", perimeter_trapezoid
  write(*,*) "Trapezoid surface area:", surface_trapezoid
end program shapes