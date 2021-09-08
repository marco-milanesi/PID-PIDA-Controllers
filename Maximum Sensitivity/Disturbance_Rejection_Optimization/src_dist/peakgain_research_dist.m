function peakgain = peakgain_research_dist(S)

w_v = [10^-2:10^-1:10^5];
[mag,phs,Frequency] = bode(S, w_v);
Magnitude = squeeze(mag);
peakgain = max(Magnitude);

end

