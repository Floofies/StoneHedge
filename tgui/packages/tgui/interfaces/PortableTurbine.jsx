// Bluemoon edit - Portable turbine generator
import { useBackend } from '../backend';
import { Box, Button, LabeledList, NoticeBox, Section } from '../components';
import { Window } from '../layouts';

export const PortableTurbine = (props) => {
  const { act, data } = useBackend();
  return (
    <Window width={450} height={340}>
      <Window.Content scrollable>
        {!data.anchored && <NoticeBox>Generator not anchored.</NoticeBox>}
        <Section title="Status">
          <LabeledList>
            <LabeledList.Item label="Power switch">
              <Button
                icon={data.active ? 'power-off' : 'times'}
                onClick={() => act('toggle_power')}
                disabled={!data.ready_to_boot}
              >
                {data.active ? 'On' : 'Off'}
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Fuel Tank">
              <Box inline>{data.fuel_moles}mol</Box>
              <Box inline>{data.fuel_pressure}kPa</Box>
              {data.tank_name !== 'No fuel tank loaded...' && (
                <Button
                  ml={1}
                  icon="eject"
                  disabled={data.active}
                  onClick={() => act('eject')}
                >
                  Eject
                </Button>
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Heat level">
              {data.current_heat}K
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Fuel Injector">
          <LabeledList>
            <LabeledList.Item label="Current injection rate">
              {data.drain_rate}x
            </LabeledList.Item>
            <LabeledList.Item label="Adjust injection rate">
              <Button icon="minus" onClick={() => act('lower_power')}>
                {data.power_generated}
              </Button>
              <Button icon="plus" onClick={() => act('higher_power')}>
                {data.power_generated}
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Power available">
              <Box inline color={!data.connected && 'bad'}>
                {data.connected ? data.power_available : 'Unconnected'}
              </Box>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
