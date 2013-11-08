Circle = require "draw/geom/circle"
Calc = require "draw/math/calc"
Draw = require("draw/draw")

module.exports = class Ball extends Circle

  vx:0
  vy:0
  ac:0
  iddle_x:0
  iddle_y:0
  speed : 1
  dx:0
  dy:0
  spring:0.2
  ax:0
  ay:0
  speed:0.1
  friction:0.9
  run:false
  init_speed:0
  line_x:0
  line_y:0

  constructor:()->
    super
    @speed = @init_speed = Math.random() * 0.1

  setup:()->
    @init_x = @x
    @init_y = @y
    @iddle_x = @init_x + Math.random() * 10
    @iddle_y = @init_y + Math.random() * 10
    @target_x = @iddle_x
    @target_y = @iddle_y
    # @angle = Calc.ang @x,@y,@iddle_x,@iddle_y

  update:(@mouseX, @mouseY)->
    # console.log Calc.dist @x,@y,@iddle_x,@iddle_y
    # console.log Calc.ang @x,@y,@iddle_x,@iddle_y
    # @distance = Calc.dist @x,@y,@iddle_x,@iddle_y

    @mouse_dist = Calc.dist @x,@y,mouseX,mouseY

    if @mouse_dist < 150
      @speed = 0.2
      @spring=0.3
      mouse_angle = Calc.ang mouseX, mouseY, @iddle_x, @iddle_y 
      mouse_angle = Calc.deg2rad mouse_angle
      dx = Math.cos mouse_angle
      dy = Math.sin mouse_angle
      @target_x = (mouseX + dx * 140)
      @line_x = (mouseX + dx * 70)
      @target_y = (mouseY + dy * 140)
      @line_y = (mouseY + dy * 70)
    else
      @spring=0.2
      @target_y = @iddle_y
      @target_x = @iddle_x

    if @mouse_dist > 180
      @speed = @init_speed




    @dx = @target_x - @x
    @dy = @target_y - @y
    @ax = @dx * @spring
    @ay = @dy * @spring

    @vx += @ax
    @vy += @ay

    if @vx > 1 or @vx < -1
      @vx *= @friction
    if @vy > 1 or @vy < -1
      @vy *= @friction

    @x += @vx * @speed
    @y += @vy * @speed

  draw:()->
    super
    if @mouse_dist < 150
      # Draw.CTX.strokeStyle = "rgba(255, 255, 255, 0.2)";
      # Draw.CTX.beginPath()
      # Draw.CTX.moveTo @mouseX, @mouseY
      # Draw.CTX.lineTo @line_x, @line_y
      # Draw.CTX.stroke();
      # Draw.CTX.closePath()

      @ctx = Draw.CTX unless @ctx
      @ctx.fillStyle = @fill
      @ctx.beginPath()
      @ctx.arc @mouseX, @mouseY, 50, 0, Math.PI*2,true
      @ctx.closePath()
      @ctx.fill()




