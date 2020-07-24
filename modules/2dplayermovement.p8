pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
 x=8
 y=80
 dy=0
 dx=0
 grounded=false
 jump=0
end

function hit(x,y,w,h)
  collide=false
  for i=x,x+w,w do
    if fget(mget(i/8,y/8))==1 or
         fget(mget(i/8,(y+h)/8))==1 then
          collide=true
    end
  end
  for i=y,y+h,h do
    if fget(mget(x/8,i/8))==1 or
         fget(mget((x+w)/8,i/8))==1 then
          collide=true
    end
  end
  return collide
end
function movementvalues()
 xaccel=0.10 --the accel
 slip=0.90 --keep under 1; .9-.95 is kinda good
 maxaccel=0.90 --this is fine
end
function playermovement()
 movementvalues()
 dy=dy+0.1
 if dx>maxaccel then
  dx=maxaccel
 end
 if dx<-maxaccel then
  dx=-maxaccel
 end
  if btn(0) then
    dx=dx-xaccel
  end
  if btn(1) then
    dx=dx+xaccel
  end
  if btnp(2) and
    (grounded) then
    grounded=false
    jump+=1
    dy=dy-1.5
  end
  if btnp(4) and
    (grounded) then
    grounded=false
    jump+=1
    dy=dy-1.5
  end
  if hit(x+dx,y,7,7) then
    dx=0
  end
  if hit(x,y+dy,7,7) then
    if dy>0 then
      grounded=true
    end
    dy=0
  end
  if grounded then
    dx=dx*slip
    jump=0
  end
  y=y+dy
  x=x+dx
 end
function _update()
 playermovement()
end
function _draw()
 cls()
 map(0,0,0,0,16,16)
 spr(1,x,y)
 print("x accel",2,12,12)
 print(dx,32,12,12)
 print("y accel",2,18,12)
 print(dy,32,18,12)
end
__gfx__
0000000000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555551111111155555555111111555511111155111155000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000010001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121212121212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1315121212121413151212121212141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1316131514131512121212141315141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1313131315121212121413161315141311111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
