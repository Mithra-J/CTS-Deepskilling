package com.cognizant;

import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class VerifyTest {
    @Test
    public void testVerifyInteraction() {
        // Arrange
        ExternalApi mockApi = mock(ExternalApi.class);
        when(mockApi.getData()).thenReturn("Mock Data");

        // Act
        MyService service = new MyService(mockApi);
        service.fetchData();

        // Assert — verify getData() was actually called once
        verify(mockApi, times(1)).getData();
        System.out.println("Verified: getData() was called exactly once");
    }
}