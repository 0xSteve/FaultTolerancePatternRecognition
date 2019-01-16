% Open thermocline datafile as CSV and read the formatted input.

function [thermocline_data] = thermoreader(name, directory)
    name = [directory '/' name];
    %The first column is the closest to the surface, each separated by 1
    %meter.
    raw_data = csvread(name, 2);
    thermocline_data = raw_data;
end