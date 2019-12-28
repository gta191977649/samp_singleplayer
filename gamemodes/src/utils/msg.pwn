stock SendFormattedMessageEx(playerid, colour, const msg[], va_args<>)
{
	new m_buffer[256];
	va_format(m_buffer, sizeof (m_buffer), msg, va_start<3>);
    return SendClientMessage(playerid, colour, m_buffer);
}