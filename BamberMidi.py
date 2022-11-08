#Moro Bamber
#CSCE 101
#Assignment a2_music

import pygame
import pygame.midi
import time

#initialize midi
pygame.midi.init()
player = pygame.midi.Output(0)

player.set_instrument(49) #String Ensemble 1

note_num = []
#creates an array of notes
for i in range(60,72):
    note_num.append(i)

#creates an array for varying durations from 0.1 - 2 seconds
duration = []
for j in range(1,20,2):
    step = j/10 + 0.1
    duration.append(step)

#First Song, singular Notes
fifth_lvb = [
    (note_num[7],duration[1],115),
    (note_num[7],duration[1],115),
    (note_num[7],duration[1],115),
    (note_num[1],duration[7],127),
    (note_num[5],duration[1],127),
    (note_num[5],duration[1],127),
    (note_num[5],duration[1],127),
    (note_num[0],duration[9],127),
    (note_num[9],duration[0],90),
    (note_num[9],duration[0],90),
    (note_num[9],duration[0],90),
    (note_num[5],duration[2],110),
    (note_num[8],duration[0],90),
    (note_num[8],duration[0],90),
    (note_num[8],duration[0],90),
    (note_num[11],duration[2],110),
    ]


def play_song(notes):
    for note in notes:
        player.note_on(note[0],note[2])
        time.sleep(note[1])
        player.note_off(note[0],note[2])

play_song(fifth_lvb) #fifth_lvb refers to the 5th Symphony by Ludwig Van Beethoven, I have attempted to replicate its opening here.

base_chord = (60,64,67,72) #other chords in song will be based off this chord

#write the song as (base chord, offset, duration, velocity)
song1 = [
    (base_chord, 0, 1, 100),
    (base_chord, 4, 1, 105),
    (base_chord, 8, 1, 115),
    (base_chord, 4, 1, 120),
    (base_chord, 0, 1, 127),
    (base_chord, 12, 2, 127),
    (base_chord, 4, 0.4, 127),
    (base_chord, 0, 0.4, 127),
    (base_chord, 4, 0.4, 127),
    (base_chord, 12, 0.4, 127),
    (base_chord, 8, 0.1, 127),
    (base_chord, 12, 2, 127),
    ]

def play_chords(song):
    for chord in song:
        offset = chord[1]
        duration = chord[2]
        velocity = chord[3]
        cur_chord = []
        for note in chord[0]: #this extracts the notes from the chord
            cur_chord.append(note)

        player.note_on(cur_chord[0] + offset, velocity)
        player.note_on(cur_chord[1] + offset, velocity)
        player.note_on(cur_chord[2] + offset, velocity)
        player.note_on(cur_chord[3] + offset, velocity)
        time.sleep(duration)
        player.note_off(cur_chord[0] + offset, velocity)
        player.note_off(cur_chord[1] + offset, velocity)
        player.note_off(cur_chord[2] + offset, velocity)
        player.note_off(cur_chord[3] + offset, velocity)



play_chords(song1)


del player
pygame.midi.quit()

