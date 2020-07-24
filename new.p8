pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
 x=8
 y=100
 dy=0
 dx=0
 grounded=false
 jump=0
end

function hit(x,y,w,h)
  collide=false
  for i=x,x+w do
    if (fget(mget(i/8,y/8))>0) or
         (fget(mget(i/8,(y+h)/8))>0) then
          collide=true
    end
  end
  for i=y,y+h do
    if (fget(mget(x/8,i/8))>0) or
         (fget(mget((x+w)/8,i/8))>0) then
          collide=true
    end
  end
  return collide
end
function movementvalues()
 xaccel=0.10 --the accel
 slip=0.90 --keep under 1; .9-.95 is kinda good
 maxaccel=0.90
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
    dy=dy-1.75
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
00000000009699000055550000cccc0000eeee00005555000022220000cccc000055550000000000777721777777217777772177099900000009900000009990
00000000009699000055550000cccc0000eeee00005555000022220000cccc0000555500000000007666d2767676d2767666d276009990000009990000099900
00000000009999000055550000cccc0000eeee00005555000022220000cccc00005555000000000076d6d2767666d276766dd2760009a000000a90000009a000
00000000009999000055550000cccc0000eeee00005555000022220000cccc000055550000000000766dd17d76d6d1777676d176006666000066660000666600
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc000011110000555500000000007666d1767666d176761dd177000660000006600000066000
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc000011110000555500000000007d66d1767666d17676d1d1760056d5000056d5000056d500
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc000011110000555500000000002dddd12d2dddd12d2d1dd12d005555000055550000555500
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc000011110000555500000000001211111212111112121111120006d0000006d0000006d000
00000000777777777777777777777777777777777777777777777777777777777777777700000000217777212177772121777721000000000000000000000000
00000000666666666666666d6676766667666666667666dd666666dd666666666666666600000000d27676d2d27666d2d27666d2000000000000000000000000
00000000666666666666d666666666666666676666d66ddd66d66ddd66d7dd666611216600000000d27666d2d2766dd2d2766dd2000000000000000000000000
00000000666666666d666d666766d76666676666666676dd666666dd667662666616626600000000d176d6d1d17676d1d17676d1000000000000000000000000
00000000666666666666666666766d666676666667d61ddd666d6ddd66d662dd662661dd00000000d17666d1d17666d1d17661d1000000000000000000000000
0000000066666666666d666666d66666666666766666d1dd66d666dd66d222dd661211dd00000000d17666d1d17666d1d17616d1000000000000000000000000
00000000dddddddddddddddddddddddddddddddddddd1ddddddddddd6666dddd6666dddd00000000d12dddd1d12dddd1d12dd1d1000000000000000000000000
00000000211111112111111121111111211111112111111121111111211111112111111100000000211221112112211121122111000000000000000000000000
00000000777777217777772177777721777777217777772177777721dd7776d2dd7776d22dddddd2000000000000000000000000000000000000000000000000
00000000766666d2766666d2767676d2776666d2767666d2766666d2d6666661d6666661d2dddd21000000000000000000000000000000000000000000000000
00000000766666d27666d6d2766666d2766667d276d66dd276d66dd276d7dd6176112161dd222211000000000000000000000000000000000000000000000000
00000000766666d17d666dd17766d6d1766766d1766676d1766666d17676626176166261dd222211000000000000000000000000000000000000000000000000
00000000766666d1766666d1767666d1767666d177d61dd1766d6dd176d662d1762661d1dd222211000000000000000000000000000000000000000000000000
00000000766666d1766d66d176d666d1766666d17666d1d176d666d166d222d1661211d1dd222211000000000000000000000000000000000000000000000000
000000002dddddd12dddddd12dddddd12dddddd12ddd1dd12dddddd1d666ddd1d666ddd1d21111d1000000000000000000000000000000000000000000000000
0000000012211111122111111221111112211111122111111221111121111111211111112111111d000000000000000000000000000000000000000000000000
00000000004444000044220000044000000440000004400000442200000000000000000000000000000000000000000000000000210000770000007721000000
000000000477fa2004977a200049f20000479200004792000477a9200e8288200082820000082000000820000008200000828200d200007600000076d2000000
0000000047f99af2497f9fa204f79f200047920004797f2047f9af92efe888820ef8882000ef8200000e2000008fe20008ef8820d200007600000076d2000000
000000004f9999a2497999f2049f9a20004f92000479f9204f999f928fe8888208f88820008f8200000e2000008f8200088f8820d100007600000076d1000000
000000004a9999a249a999a2049a9f20004a920004f9a9204a999a9208fe882000fe8200008f820000082000008f8200008fe200d100007600000076d1000000
000000004fa99a72497a9af204af9a20004f920004a9fa204fa9a792008882000088820000082000000820000008200000888200d100007600000076d1000000
0000000004aa772004977f200049a200004a9200004a920004a77920000820000008200000082000000820000008200000082000d100002d0000002dd1000000
00000000004422000042220000042000000420000004200000422200000000000000000000000000000000000000000000000000110000120000001211000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888ffffff882222228888888888888888888888888888888888888888888888888888888888888888228228888ff88ff888222822888888822888888228888
88888f8888f882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888222822888882282888888222888
88888ffffff882888828888888888888888888888888888888888888888888888888888888888888882288822888f8ff8f888222888888228882888888288888
88888888888882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888888222888228882888822288888
88888f8f8f88828888288888888888888888888888888888888888888888888888888888888888888822888228888ffff8888228222888882282888222288888
888888f8f8f8822222288888888888888888888888888888888888888888888888888888888888888882282288888f88f8888228222888888822888222888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557777777777770000000000000000000000000000005555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777777777777777777777777777777777777777777777222222221111111105555557000000000071111111112222222222333333333305555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555557000000000071111111112222222222333333333305555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555557777777777775555555556666666666777777777705555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
55555550777777776666666666666666666666666666666666666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd2222222205555550444444444455555555556666666666777777777705555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd222222220555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd222222220555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd222222220555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd222222220555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd222222220555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777666666666666666666666666dddddddd66666666dddddddd222222220555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd111111110555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd111111110555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd111111110555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
5555555077777777dddddddd666666666666666666666666dddddddddddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555550000000000000000000000000000000000000000005555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555555555555555555555555555555555555555555555555555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555555555555555555555555555555555555555555555555555555
55555550777777776666666666666666666666666666666666666666dddddddd1111111105555555555555555555555555555555555555555555555555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555556666666555555555555555555555555555556667655555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555556000006555555555555555555555555555555666555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd111111110555555600000655555555ddddddddddddddddddddddd65555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555556000006555555565555555555555555555555565555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555556000006555555576666666d6666666d666666655555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555556000006555555555555555555555555555555555555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555556666666555555555555555555555555555555555555555555
55555550777777776666666666666666dddddddd6666666666666666dddddddd1111111105555555555555555555555555555555555555555555555555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd1111111105555555555555555555555555555555555555555555555555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd1111111105555556665666555556667655555555555555555555555555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd1111111105555556555556555555666555555555555555555555555555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd111111110555555555555555555556dddddddddddddddddddddddd5555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd11111111055555565555565555555655555555555555555555555d5555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd1111111105555556665666555555576666666d6666666d666666655555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd1111111105555555555555555555555555555555555555555555555555555555
5555555022222222dddddddddddddddddddddddddddddddddddddddddddddddd1111111105555555555555555555555555555555555555555555555555555555
55555550111111112222222222222222111111111111111111111111111111111111111105555555555555555555555555555555555555555555555555555555
55555550111111112222222222222222111111111111111111111111111111111111111105555555555555555555555555555555555555555555555555555555
55555550111111112222222222222222111111111111111111111111111111111111111105555550005550005550005550005550005550005550005550005555
555555501111111122222222222222221111111111111111111111111111111111111111055555088705011d05011d05011d05011d05011d05011d05011d0555
55555550111111112222222222222222111111111111111111111111111111111111111105555508880501110501110501110501110501110501110501110555
55555550111111112222222222222222111111111111111111111111111111111111111105555508880501110501110501110501110501110501110501110555
55555550111111112222222222222222111111111111111111111111111111111111111105555550005550005550005550005550005550005550005550005555
55555550111111112222222222222222111111111111111111111111111111111111111105555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555555555575555555ddd55555d5d5d5d55555d5d555555555d5555555ddd5555557777772155555555555555555555555555555555555555555555555555
555555555555777555555ddd55555555555555555d5d5d55555555d55555d555d55555766666d256666666666666555557777755555555555555555555555555
555555555557777755555ddd55555d55555d55555d5d5d555555555d555d55555d55557666d6d256ddd6ddd6d6d6555577ddd775566666555666665556666655
555555555577777555555ddd55555555555555555ddddd5555ddddddd55d55555d55557d666dd156d6d666d6d6d6555577d7d77566dd666566ddd66566ddd665
5555555557577755555ddddddd555d55555d555d5ddddd555d5ddddd555d55555d5555766666d156d6d66dd6ddd6555577d7d775666d66656666d665666dd665
5555555557557555555d55555d55555555555555dddddd555d55ddd55555d555d55555766d66d156d6d666d666d6555577ddd775666d666566d666656666d665
5555555557775555555ddddddd555d5d5d5d555555ddd5555d555d5555555ddd5555552dddddd156ddd6ddd666d655557777777566ddd66566ddd66566ddd665
55555555555555555555555555555555555555555555555555555555555555555555551221111156666666666666555577777775666666656666666566666665
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566666665ddddddd5ddddddd5ddddddd5
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009699000055550000cccc0000eeee00005555000022220000cccc000055550000000000000000000000000000000000000000000000000000000000
00000000009699000055550000cccc0000eeee00005555000022220000cccc000055550000000000000000000000000000000000000000000000000000000000
00000000009999000055550000cccc0000eeee00005555000022220000cccc000055550000000000000000000000000000000000000000000000000000000000
00000000009999000055550000cccc0000eeee00005555000022220000cccc000055550000000000000000000000000000000000000000000000000000000000
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc00001111000055550000000000000000000000000000000000000000000000000000000000
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc00001111000055550000000000000000000000000000000000000000000000000000000000
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc00001111000055550000000000000000000000000000000000000000000000000000000000
0000000000aaaa00008888000077770000bbbb0000ffff0000cccc00001111000055550000000000000000000000000000000000000000000000000000000000
00000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000211111077777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777077777772170777721777777217777772177777721dd7776d2dd7776d22dddddd2000000000000000000000000000000000000000000000000
0000000076666607766666d2717676d2776666d2767666d2766666d2d6666661d6666661d2dddd21000000000000000000000000000000000000000000000000
00000000766666077666d6d2171666d2766667d276d66dd276d66dd276d7dd6176112161dd222211000000000000000000000000000000000000000000000000
00000000766666077d666dd11771d6d1766766d1766676d1766666d17676626176166261dd222211000000000000000000000000000000000000000000000000
0000000076666607766666d1177716d1767666d177d61dd1766d6dd176d662d1762661d1dd222211000000000000000000000000000000000000000000000000
0000000076666607766d66d1177771d1766666d17666d1d176d666d166d222d1661211d1dd222211000000000000000000000000000000000000000000000000
000000002ddddd072dddddd117711dd12dddddd12ddd1dd12dddddd1d666ddd1d666ddd1d21111d1000000000000000000000000000000000000000000000000
0000000012211107122111117117111112211111122111111221111121111111211111112111111d000000000000000000000000000000000000000000000000
00000000004444077777777770044000000440000004400000442200000000000000000000000000000000000000000000000000000000000000007721000000
000000000477fa00000000000049f20000479200004792000477a9200e82882000828200000820000008200000082000008282000000000000000076d2000000
0000000047f99af2497f9fa204f79f200047920004797f2047f9af92efe888820ef8882000ef8200000e2000008fe20008ef88200000000000000076d2000000
000000004f9999a2497999f2049f9a20004f92000479f9204f999f928fe8888208f88820008f8200000e2000008f8200088f88200000000000000076d1000000
000000004a9999a249a999a2049a9f20004a920004f9a9204a999a9208fe882000fe8200008f820000082000008f8200008fe2000000000000000076d1000000
000000004fa99a72497a9af204af9a20004f920004a9fa204fa9a7920088820000888200000820000008200000082000008882000000000000000076d1000000
0000000004aa772004977f200049a200004a9200004a920004a77920000820000008200000082000000820000008200000082000000000000000002dd1000000
00000000004422000042220000042000000420000004200000422200000000000000000000000000000000000000000000000000000000000000001211000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__gff__
0000000000000000000001010100000000010101010101010100010101000000000101010101010101000000000000000008080808080810101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
2621222622232123222622262623222600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
143f2a2a2a2a2a2a2a2a2a2a2a2a3e1700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
163f2a2a2a2a2a2a2a2a2a2a2a2a3e1200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
153f2a2a2a2a2a2a2a2a2a2a2a2a3e1400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
143f2a3e153f2a2a2a2a2a2a2a2a3e1300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
123f2a3e1a133d1b123f2a2a2a2a3e1200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
173f2a3e1a0b3d131c0b3f2a2a2a3e1300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
153f2a2a2a2a3e1526250b153f2a3e1700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
143f2a2a2a2a3e133d133f2a3e121b2100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
230b123f2a2a2a2a2a2a2a3e121b232300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2325252a2a2a2a2a2a2a3e121a22222300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22252a2a2a2a2a3e17153f2a2a3e151a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
163f2a2a2a3e131c240a133f2a2a3e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
133f2a2a3e141a2327220a143f2a3e1200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
123f3e123d161b242625260a143f3e1400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2324222326252322232424232224232400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
