s= tf('s');
G = (220 * s * 10^-6)/(1+ 220 * s * 10^-6)

bode(G)