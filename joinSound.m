function out = joinSound( x,y )

if length(x)>=length(y)
    max=length(x);
else
    max=length(y);
end
joinLimit=round(max/2)-1;
joinidx=randi([1,joinLimit]);

% if length(x)>length(y)
%     while length(x)>length(y)
%         y=[y;0];
%     end
% elseif length(y)>length(x)
%     while length(y)>length(x)
%         x=[x;0];
%     end
% end
if length(x)>=length(y)
prepad=length(x(1:joinidx));
y=padarray(y,prepad,0,'pre');
else
prepad=length(y(1:joinidx));
x=padarray(x,prepad,0,'pre');
end

if length(x)>length(y)
    postpad=length(x)-length(y);
    y=padarray(y,postpad,0,'post');
    
elseif length(y)>length(x)
    postpad=length(y)-length(x);
    x=padarray(x,postpad,0,'post');
end  
out=y+x;

end

