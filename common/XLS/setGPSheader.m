function [ GPSheader ] = setGPSheader( filename, sheetname, version, name, description, location, date, coordinateSystem, mapStruct, refOrUnit, long, lat, alt, numCoordinates )
%SETGPSHEADER Summary of this function goes here
%   Detailed explanation goes here

    if (version == 1)
        if (strcmp(coordinateSystem,'UTM'))
            sourceStruct = struct('File', filename, ...
                                  'Sheet', sheetname, ...
                                  'CoordinateSystem', coordinateSystem, ...
                                  'mapStruct', mapStruct);
        elseif (strcmp(coordinateSystem,'LL'))
            sourceStruct = struct('File', filename, ...
                                  'Sheet', sheetname, ...
                                  'CoordinateSystem', coordinateSystem, ...
                                  'Unit', refOrUnit);
        else
            error('Unknown unit for LL coordinate system. Must be either DEG (decimal degrees) or RAD (radians).');
        end
    else
        error(['Unknown version in file: ' filename ', sheet: ' sheetname])
    end

    GPSheader = struct('Version',version, ...
                       'Name',name, ...
                       'Description',description, ...
                       'Location',location, ...
                       'Date',date, ...
                       'Source', sourceStruct, ...
                       'Longitude', long, ...
                       'Latitude', lat, ...
                       'Altitude', alt, ...
                       'numCoordinates', numCoordinates);

end

