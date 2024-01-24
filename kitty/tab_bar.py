import datetime
from kitty.boss import get_boss
from kitty.fast_data_types import Screen, get_options, add_timer
from kitty.tab_bar import (DrawData, ExtraData, TabBarData , as_rgb,
                           draw_tab_with_separator)
from kitty.utils import color_as_int

opts = get_options()

REFRESH_TIME = 1

CLOCK_FG = as_rgb(color_as_int(opts.color6))
CLOCK_BG = 0
DATE_FG = as_rgb(color_as_int(opts.color6))
DATE_BG = 0

def _draw_right_status(screen: Screen, is_last: bool) -> int:
    if not is_last:
        return screen.cursor.x

    cells = [
        # (CLOCK_FG, CLOCK_BG, datetime.datetime.now().strftime("  %I:%M %p ")),
        # (DATE_FG, DATE_BG, datetime.datetime.now().strftime("  +%a, %d %b ")),
        (DATE_FG, DATE_BG, datetime.datetime.now().strftime(" %a, %d %b ")),
        (CLOCK_FG, CLOCK_BG, datetime.datetime.now().strftime(" %I:%M %p ")),
    ]

    right_status_length = 0
    for _, _, cell in cells:
        right_status_length += len(cell)

    draw_spaces = screen.columns - screen.cursor.x - right_status_length
    if draw_spaces > 0:
        screen.draw(" " * draw_spaces)

    for fg, bg, cell in cells:
        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(cell)
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    screen.cursor.x = max(screen.cursor.x, screen.columns - right_status_length)
    return screen.cursor.x

def _redraw_tab_bar(_):
    tm = get_boss().active_tab_manager
    if tm is not None:
        tm.mark_tab_bar_dirty()

timer_id = None

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global timer_id
    end = draw_tab_with_separator(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )
    if timer_id is None:
        timer_id = add_timer(_redraw_tab_bar, REFRESH_TIME, True)
    _draw_right_status(
        screen,
        is_last,
    )
    return end
