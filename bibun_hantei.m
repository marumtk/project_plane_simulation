function check = bibun_hantei(freq,data_set,delta_z,camera_width,camera_height,proj_width,P_proj,P_camera,Z_start)
%基準平面における微分情報
[a_real,b_real] = plane_simulation(Z_start,freq,camera_width,camera_height,proj_width,P_proj,P_camera);

%微分情報を取得するデータの数
p = zeros(data_set,2);

for i = 1:data_set
    [p(i,1),p(i,2)] = plane_simulation(Z_start+delta_z*(i-data_set/2),freq,camera_width,camera_height,proj_width,P_proj,P_camera);
end

check = ones(data_set,1);
for i = 1:data_set
    if abs( b_real^2/(2*a_real) - p(i,2)^2/(2*p(i,1)) ) >= pi
        check(i,1) = 0;
    elseif abs( 0.5*camera_width^2*(a_real-p(i,1)) ) >= pi
        check(i,1) = 0;
    %elseif abs( b_real^2/(2*a_real) - p(i,2)^2/(2*p(i,1)) - 0.5*(b_real-p(i,2))^2/(a_real-p(i,1)) ) >= pi
        %check(i,1) = 0;
    end  
end

result = find(check(:,1)==1);
for i = 1:length(result)
    result(i) = Z_start+delta_z*(result(i)-data_set/2);
end

end