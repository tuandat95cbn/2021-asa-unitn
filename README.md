# Antonomous Software Agents
The project course of Antonomous Software Agents at the University of Trento
## Homework and assigment
## Project - National vaccine distribution
### High level description of the scenario
- There is a central point (red circle) in a state (e.g., Italy) that receives all
the vaccine boxes, and from there the vaccine boxes shall be distributed
to one designated central location (violet circle), one for each region.
- Once the vaccine boxes reach the designated central locations in a
region, such vaccine boxes shall be distributed to the different provinces
(yellow circles) of the region.
- From the designated location in each province the vaccines shall be
distributed to the different health districts (purple circles) within the
same region.
- Transportation of vaccine boxes is performed with different transport
agents (planes, trucks, and drones).
- Problem:
  - Initially all the vaccine boxes are in the central location of the state.
  - The goal is that there is at least one vaccine box in each health
district.
### Constraints
- We have a fixed number R of regions (R >= 15).
- For each region we have at least P different provinces (P >= 6).
- Not all the regions and province have an airport.
- For each province we assume there are at most D health districts (D >= 3).
- Movement of vaccines among locations is performed with different kind of vehicles
(planes, trucks, drones).
- Each agent can load and unload in a transport agent (plane, truck, drone) a vaccine
box at a time.
- Drones can only be used to transport vaccine boxes from the province central
designated location to the health districts of the province.
- Trucks and planes can be used in all the other cases, trucks shall be used to reach
locations with no airport.
- All the movement agents (planes, trucks, drones) have limited capacity for vaccine
boxes (C >= 1).
- There are a limited number of planes (NP >= 2) and trucks (NT >= 10) at national
level. Similarly, the drones in each region are limited (ND >= 1).
