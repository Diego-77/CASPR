% A parameterised representation of cable attachment locations 
% where cables are attachable on a cylindrical frame (with fixed radius)
% used for cable attachment optimisation 
% 
% Author        : Darwin LAU
% Created       : 2016
% Description	:
%   It is currently assumed that cylinder is centred at (0, 0, 0) and the
%   orientation is pointing in the "z" direction. In the future a centre
%   point and direction for the "z" axis should be added.
classdef AttachmentPointParamCylindricalFixedR < AttachmentPointParamBase
    properties (SetAccess = private)
        radius;
        t_range;
        z_range;
    end
    
    properties (Dependent)
        x_min
        x_max
    end
    
    properties (Constant)
        numVars = 2;
    end
    
    methods
        function ap = AttachmentPointParamCylindricalFixedR(r, t_range, z_range, attachmentRefType)
            ap@AttachmentPointParamBase(attachmentRefType);
            ap.radius = r;
            ap.t_range = t_range;
            ap.z_range = z_range;
        end
                
        function value = get.x_min(obj)
            value = [obj.t_range(1); obj.z_range(1)];
        end
        
        function value = get.x_max(obj)
            value = [obj.t_range(2); obj.z_range(2)];
        end
    end
    
    methods (Access = protected)
        function r = paramToAttachments(obj, x)
            theta = x(1);
            z = x(2);
            r = [obj.radius * cos(theta); obj.radius * sin(theta); z];
        end
    end
end

