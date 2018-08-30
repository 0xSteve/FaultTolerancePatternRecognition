%This is a script to plot the GPS coordinates.
receiver_loc = [44.783413, 78.050114];
send_loc1 = [44.783445, 78.05001];
send_loc2 = [44.783441,78.050114];
send_loc3 = [44.783454,78.050015];
figure
hold on
p = scatter(44.783413, 78.050114, [], 'red')
text(44.783412, 78.050112, 'Receiver')
p1 = scatter(44.783445, 78.05001, [], 'blue')
text(44.783445, 78.050009, 'Send Location 1')
p2 = scatter(44.783441,78.050114, [], 'blue')
text(44.783439,78.050112, 'Send Location 2')
p3 = scatter(44.783454,78.050015, [], 'blue')
text(44.783445485,78.050015, 'Send Location 3')
title('Sensor Positions')
xlabel('Latitude')
ylabel('Longitude')