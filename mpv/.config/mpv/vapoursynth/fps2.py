import vapoursynth as vs
core = vs.get_core()

clip = video_in

src_num = int(float(container_fps) * 1e3)
src_den = int(1e3)
play_num = int(float(display_fps) * 1e3)
play_den = int(1e3)

if not (container_fps > 59):
    clip = core.std.AssumeFPS(clip, fpsnum=src_num, fpsden=src_den)
    sup  = core.mv.Super(clip, pel=2, hpad=16, vpad=16)
    bvec = core.mv.Analyse(sup, blksize=32, isb=True , chroma=True, search=0, searchparam=1)
    fvec = core.mv.Analyse(sup, blksize=32, isb=False, chroma=True, search=0, searchparam=1)
    clip = core.mv.FlowFPS(clip, sup, bvec, fvec, num=play_num, den=play_den, mask=0)

clip.set_output()
